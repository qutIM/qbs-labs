import qbs.base 1.0

Module {
    property paths libPaths //: "/usr/lib"
    property string incPath //: "/usr/include"

    //internal
    property string kdeConfigExecutable: "kde4-config"

    Probe {
        id: kdeConfigProbe
        condition: false //i need probe variables dependencies

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
            qbs.modules.kde.core.incPath = getKdeVariable("path", "include");
            qbs.modules.kde.core.libPaths = getKdeVariable("path", "lib").split(qbs.pathListSeparator);
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
        if (!libPaths)
            throw "kde.core.libPaths not set."
    }
}
