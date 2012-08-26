import qbs.base 1.0

PathProbe {
    pathSuffixes: [ "lib64", "lib" ]

    convertName: function(name) {
        throw name;
    }
}
