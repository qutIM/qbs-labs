import qbs.base 1.0
import "../../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "TelepathyQt4"
    libraryNames: [ "telepathy-qt4" ]
    includeNames: [ "global.h" ]
    includeSuffix: "telepathy-qt4/TelepathyQt"
}
