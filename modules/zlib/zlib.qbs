import qbs.base 1.0
import "../../imports/probes" as Probes

Module {
    Depends { name: "cpp" }
    Probes.LibraryProbe {
        id: libraryProbe
        names: "z"
    }
    Probes.IncludeProbe {
        id: includeProbe
        names: "zlib.h"
    }
    cpp.includePaths: includeProbe.path
    cpp.dynamicLibraries: libraryProbe.filePath
}
