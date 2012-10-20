import qbs.base 1.0

PathProbe {
    pathSuffixes: [ "include" ]
    platformEnvironmentPaths: {
        return [ "INCLUDE" ];
    }
}
