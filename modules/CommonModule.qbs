import qbs.base 1.0
import "../imports/probes" as Probes

Module {
    property string pkgConfigName
    property var libraryNames
    property var includeNames
    Depends { name: "cpp" }

    Probes.PkgConfigProbe {
        id: pkgConfigProbe

        condition: pkgConfigName !== undefined
        name: pkgConfigName
    }
    Probes.LibraryProbe {
        id: libraryProbe

        condition: !pkgConfigProbe.found
        names: libraryNames
    }
    Probes.IncludeProbe {
        id: includeProbe

        condition: !pkgConfigProbe.found
        names: includeNames
    }
    
    condition: { 
        if(!pkgConfigProbe.found && !libraryProbe.found) {
            // FIXME: Add check for required library
            throw "CommonModule: library " + pkgConfigName + " not found. Aborting";
        }
        else
            return true;
    }

    cpp.cFlags: pkgConfigProbe.cflags
    cpp.cxxFlags: pkgConfigProbe.cflags
    cpp.objcFlags: pkgConfigProbe.cflags
    cpp.linkerFlags: pkgConfigProbe.libs

    cpp.includePaths: {
        if (!pkgConfigProbe.found)
            return includeProbe.filePath
    }
    cpp.dynamicLibraries: {
        if (!pkgConfigProbe.found)
            return libraryProbe.filePath
    }
}

