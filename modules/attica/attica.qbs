import qbs.base 1.0
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "libattica"
    libraryNames: "attica"
    includeNames: "attica/person.h"
}
