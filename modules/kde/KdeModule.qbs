import qbs.base 1.0
import "../CommonModule.qbs" as CommonModule

CommonModule {
    property string kdeModuleName
    property string kdeLibInfix: "k"
    property string repository

    property string kdeVersion: getKdeVariable("kde-version")
    property string kdePrefix: getKdeVariable("prefix")
    property string kdeIncludePrefix: getKdeVariable("path include")

    //internal
    property string kdeConfigExecutable: "kde4-config"

    function getKdeVariable(arg) {
        var p = new Process();
        var args = ["--" + arg]
        if (p.exec(kdeConfigExecutable, args) === 0) {
            var variable = p.readAll().trim();
            print ("Found kde variable " + arg + " " + variable);
            return variable;
        }
    }

    libraryNames: kdeLibInfix + kdeModuleName
    includeNames: [libraryNames, libraryNames + "_export.h",
        libraryNames + "/" + libraryNames + "_export.h",
        ]
}
