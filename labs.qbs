import qbs.base 1.0
import qbs.fileinfo as FileInfo

Project {
    moduleSearchPaths: "modules"
    CppApplication {
        name: "labs"
        files: "main.cpp"
        Depends { name: "archive" }
        Depends { name: "hunspell" }
        Depends { name: "aspell" }
        Depends { name: "zlib" }
        Depends { name: "qca" }
        Depends { name: "otr" }
        Depends { name: "qt.core" }
        Depends { name: "idn" }
        Depends { name: "dbusmenu.qt" }
        Depends { name: "dbusmenu.glib" }
        Depends { name: "dbusmenu.gtk2" }
        Depends { name: "dbusmenu.gtk3" }
        Depends { name: "kde"; submodules: [ 'kio', 'knotifyconfig', 'kutils', 'core', 'ui', 'phonon'] }
/*        Depends { name: "kde.kio" }
        Depends { name: "kde.knotifyconfig" }
        Depends { name: "kde.kutils" }
        Depends { name: "kde.core" }
        Depends { name: "kde.ui" }*/
        Depends { name : {
            print("->>>>>>>>>>>>" + FileInfo.relativePath("","data/webview/terminator.png"));
            return "sdl.mixer"; 
        }}
    }
}
