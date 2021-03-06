import qbs.base 1.0
import qbs.fileinfo as FileInfo
import "../imports/probes" as Probes

Module {
    property string frameworkName
    property string pkgConfigName
    property var libraryNames
    property var includeNames
    property string includeSuffix: ""

    Depends { name: "cpp" }

    Probes.FrameworkProbe {
        id: frameworkProbe

        condition: frameworkName !== undefined
        names: frameworkName
    }
    Probes.PkgConfigProbe {
        id: pkgConfigProbe
        name: pkgConfigName
    }
    Probes.LibraryProbe {
        id: libraryProbe
        names: libraryNames
    }
    Probes.IncludeProbe {
        id: includeProbe
        names: includeNames
        pathSuffixes: ["include/" + includeSuffix, "include", includeSuffix]
    }
    
    Properties {
        condition: frameworkProbe.found

        cpp.frameworks: {
            if (frameworkProbe.found) {
                print("FrameworkProbe: found " + frameworkName);
                return frameworkName;
            }
            return base;
        }
        cpp.frameworkPaths: frameworkProbe.path
        cpp.includePaths: FileInfo.joinPaths(frameworkProbe.filePath, "Headers")
    }
    
    Properties {
        condition: pkgConfigProbe.found

        cpp.includePaths: pkgConfigProbe.includePaths
        cpp.libraryPaths: pkgConfigProbe.libraryPaths
        cpp.dynamicLibraries: pkgConfigProbe.dynamicLibraries

        //cpp.cxxFlags: pkgConfigProbe.cflags
        //cpp.objcFlags: pkgConfigProbe.cflags
        //cpp.cFlags: pkgConfigProbe.cflags

        cpp.linkerFlags: pkgConfigProbe.linkerFlags
    }
    
    Properties {
        condition: !pkgConfigProbe.found && libraryProbe.found && includeProbe.found

        cpp.includePaths: {
            if (includeProbe.filePath /*includeProbe.found*/) {
                print("IncludeProbe: found " + includeProbe.path);
                return includeProbe.path;
            } else {
                print("IncludeProbe: could not found include path for " + includeNames + " [" + includeSuffix + "]");
            }
            return base;
        }
        cpp.dynamicLibraries: {
            if (libraryProbe.filePath /*libraryProbe.found*/) {
                print("LibraryProbe: found library " + libraryProbe.filePath);
                return libraryProbe.filePath;
            } else {
                print("LibraryProbe: could not found library " + libraryNames);
            }
            return base;
        }
    }
}

