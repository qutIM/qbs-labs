import qbs.base 1.0
import "../../imports/probes" as Probes

Module {
    condition: qbs.targetOS === "linux"
    Depends { name: "cpp" }
    Probes.PkgConfigProbe {
        id: probe
        name: "qca2"
//        required: true
    }
    cpp.cFlags: probe.cflags
    cpp.cxxFlags: probe.cflags
    cpp.objcFlags: probe.cflags
    cpp.linkerFlags: probe.libs
}
