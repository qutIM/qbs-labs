import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    libraryNames: ["kio"]
    includeNames: ["kio/", "kio_export.h"]
}
