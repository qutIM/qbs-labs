import qbs.base 1.0
import qbs.fileinfo 1.0 as FileInfo
import "../../imports/probes" as Probes

Module {
    property var libraryNames

    condition: qbs.targetOS === "windows"

    Depends { name: "cpp" }
    Probes.LibraryProbe {
        id: libraryProbe
        names: libraryNames
    }
    Properties {
        condition: libraryProbe.found

        cpp.dynamicLibraries: {
            if (libraryProbe.filePath /*libraryProbe.found*/) {
                print("WinapiModule: found library " + libraryProbe.filePath);
                return libraryProbe.filePath;
            } else {
                print("WinapiModule: could not found library " + libraryNames);
            }
        }
    }
}
