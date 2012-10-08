import qbs.base 1.0

Module {
    property paths libPaths: kdeConfigProbe.libPaths
    property string incPath: kdeConfigProbe.incPath

    //internal
    property string kdeConfigExecutable: "kde4-config"

    Probe {
        id: kdeConfigProbe

        property paths libPaths
        property string incPath

        function getKdeVariable(key, arg) {
            var p = new Process();
            var args = ["--" + key];
            if (arg)
                args.push(arg);
            if (p.exec(kdeConfigExecutable, args) === 0) {
                var variable = p.readAll().trim();
                print ("Found kde variable " + key + " - " + variable);
                return variable;
            }
            return '';
        }

        configure: {
            incPath = getKdeVariable("path", "include");
            libPaths = getKdeVariable("path", "lib").split(qbs.pathListSeparator);
        }

    }

    Depends { name: "cpp" }

    cpp.libraryPaths: libPaths
    cpp.dynamicLibraries: "kdecore"
    cpp.includePaths: [
        incPath,
        incPath + "/KDE"
    ]

    setupBuildEnvironment: {
        // Not really a setup in this case. Just some sanity checks.
        if (!incPath)
            throw "kde.core.incPath not set.";
    }
}
