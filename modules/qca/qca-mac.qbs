import qbs.base 1.0

Module {
    condition: qbs.targetOS === "mac"
    Depends { name: "cpp" }
    // TODO: FrameworkProbe
//    Probes.FrameworkProbe {
//        id: probe
//    }

    cpp.frameworks: "qca"
    cpp.frameworkPaths: "/usr/local/lib"
    cpp.includePaths: "/usr/local/lib/qca.framework/Headers"
}
