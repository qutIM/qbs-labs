import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "libotr"
    libraryNames: ["otr"]
    includeNames: ["libotr"]
}
