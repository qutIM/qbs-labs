import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "x11"
    libraryNames: ["x11"]
    includeNames: ["Xlib.h"]
    includeSuffix: "X11"
}
