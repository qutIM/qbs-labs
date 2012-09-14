import qbs.base 1.0
import "../../imports/probes" as Probes
import "Utils.js" as Utils

Module {
    condition: kdeConfigExecutable !== undefined
    property string kdeModuleName
    
    property bool useIncludeProbe: false
    property var kdeIncludeSuffixes
    property var kdeIncludeNames: [ kdeModuleName + "_export.h" ]

//    property string kdeLibInfix: "k"
//    property string repository

    property string kdeVersion: getKdeVariable("kde-version")
    property string kdePrefix: getKdeVariable("prefix")
    property string kdeIncludePrefix: getKdeVariable("path", "include")
    property string kdeLibPrefix: getKdeVariable("path", "lib").split(qbs.pathListSeparator)

    //internal
    property string kdeConfigExecutable: qbs.targetOS === 'linux' ? "kde4-config" : undefined
    //property string kdeConfigExecutableName: "kde4-config"
    //property string kdeModuleNameInternal: kdeModuleName

    function getKdeVariable(key, arg) {
        var p = new Process();
        var args = ["--" + key];
        if (arg)
            args.push(arg);
        if (p.exec(this.kdeConfigExecutable, args) === 0) {
            var variable = p.readAll().trim();
            //print ("Found kde variable " + key + " - " + variable);
            return variable;
        }
        return '';
    }

    Depends { name: "cpp" }
    cpp.includePaths: [
        kdeIncludePrefix,
        kdeIncludePrefix + "/KDE"
    ]

    Probes.LibraryProbe {
        id: libraryProbe

        platformPaths: kdeLibPrefix
        names: kdeModuleName
    }
    
    Probes.IncludeProbe {
        id: includeProbe

        condition: useIncludeProbe
        platformPaths: kdeIncludePrefix
        names: kdeIncludeNames
        pathSuffixes: kdeIncludeSuffixes
    }

    //Probes.BinaryProbe {
    //    id: kdeExecutableProbe
    //    names: kdeConfigExecutableName
    //}

    Properties {
        condition: libraryProbe.found
        cpp.dynamicLibraries: {
            print ("KdeLibrary: found " + libraryProbe.filePath);
            return libraryProbe.filePath;
        }
    }

    Properties {
        condition: useIncludeProbe && includeProbe.found
        cpp.includePaths: {
            print ("KdeInclude: found " + includeProbe.path);
            return outer.concat(includeProbe.path);
        }   
    }

    // Doesn't work
    //Properties {
    //    condition: kdeExecutableProbe.found

    //    kdeConfigExecutable: kdeExecutableProbe.filePath
    //}
}
