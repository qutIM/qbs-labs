import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    pkgConfigName: "hunspell"
    libraryNames: [ "hunspell" , "hunspell-1.2", "hunspell-1.3" ]
    includeNames: [ "hunspell.hxx" ]
}
