import qbs.base 1.0

Module {
    property paths libPaths: "/usr/lib"
    property string incPath: "/usr/include"

    //internal
    property string kdeConfigExecutable: "kde4-config"

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
        if (!libPaths.length)
            throw "kde.core.libPaths not set."
    }
}
