import qbs.base 1.0

PathProbe {
    pathSuffixes: [ "lib64", "lib" ]
    platformEnvironmentPaths: {
        return "LIB";
    }

    function convertName(name) {
        if (qbs.targetOS === "linux")
            return "lib" + name + ".so"
        else if (qbs.targetOS === "mac")
            return "lib" + name + ".dylib";
        else if (qbs.targetOS === "windows")
            if (qbs.toolchain === "mingw")
                return "lib" + name + ".a";
            else
                return name + ".lib";
        else
            return name;
    }
}
