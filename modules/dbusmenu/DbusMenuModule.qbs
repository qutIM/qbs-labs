import qbs.base 1.0
import "../CommonModule.qbs" as CommonModule

CommonModule {
    property string version

    //internal
    property string packageName: {
        var name = libraryNames;
        if (version !== undefined)
            name += "-" + version;
        return name;
    }
    property string libraryName: name.replace('/', '-')

    libraryNames: libraryName
    includeNames: libraryName
    includeSuffix: packageName
    pkgConfigName: packageName
}
