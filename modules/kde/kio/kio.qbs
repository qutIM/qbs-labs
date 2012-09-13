import qbs.base 1.0
import "../KdeModule.qbs" as KdeModule

KdeModule {
    kdeModuleName: "kio"
    kdeIncludeSuffixes: "kio"
    useIncludeProbe: true
}
