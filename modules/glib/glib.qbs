import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "glib-2.0"
    libraryNames: ["glib-2.0"]
    includeNames: ["glib.h"]
    includeSuffix: "glib-2.0"
}
