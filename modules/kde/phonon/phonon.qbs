import qbs.base 1.0
import "../KdeModule.qbs" as KdeModule

KdeModule {
    kdeModuleName: "phonon"
    kdeIncludeSuffixes: "phonon"
    useIncludeProbe: true
}
