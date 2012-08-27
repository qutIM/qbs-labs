import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "zlib"
    libraryNames: ["z", "zlib"]
    includeNames: ["zlib.h"]
}
