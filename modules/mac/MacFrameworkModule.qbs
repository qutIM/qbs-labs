import qbs.base 1.0
import qbs.fileinfo 1.0 as FileInfo
import "../../imports/probes" as Probes

Module {
    property string frameworkName

    Depends { name: "cpp" }

    Probes.FrameworkProbe {
        id: frameworkProbe

        condition: frameworkName !== undefined
        names: frameworkName
    }

    condition: frameworkProbe.found

    Properties {
        condition: frameworkProbe.found

        cpp.frameworks: frameworkName
        cpp.frameworkPaths: frameworkProbe.path
        cpp.includePaths: FileInfo.joinPaths(frameworkProbe.filePath, "Headers")
    }
}

