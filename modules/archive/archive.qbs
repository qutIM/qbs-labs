import qbs.base 1.0
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "libarchive"
    libraryNames: ["libarchive", "archive"]
    includeNames: ["archive.h"]
}
