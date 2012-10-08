import qbs.base 1.0
import "../../imports/probes" as Probes

Module {
    property string kdeModuleName
    
    property bool useIncludeProbe: false
    property var kdeIncludeSuffixes
    property var kdeIncludeNames: [ kdeModuleName + "_export.h" ]

    Depends { name: "cpp" }
    Depends { name: "kde.core" }

    cpp.includePaths: [
        kde.core.incPath,
        kde.core.incPath + "/KDE"
    ]

    Probes.LibraryProbe {
        id: libraryProbe
        names: kdeModuleName
        platformPaths: kde.core.libPaths
    }
    Probes.IncludeProbe {
        id: includeProbe

        condition: useIncludeProbe
        names: kdeIncludeNames
        pathSuffixes: kdeIncludeSuffixes
        platformPaths: kde.core.incPath
    }

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

    setupBuildEnvironment: {
        //TODO add library checks
    }
}
