import qbs.base 1.0
import "../../imports/probes" as Probes

Module {
    condition: qbs.targetOS === "linux"
    Depends { name: "cpp" }
    Probes.PkgConfigProbe {
        id: probe_zlib
        name: "zlib"
//        required: true
    }
    cpp.cFlags: { print(probe_zlib.cflags); return probe_zlib.cflags; }
    cpp.cxxFlags: probe_zlib.cflags
    cpp.objcFlags: probe_zlib.cflags
    cpp.linkerFlags: probe_zlib.libs
}
