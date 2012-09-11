import qbs.base 1.0
import "../../imports/probes" as Probes
import "../CommonModule.qbs" as CommonModule

CommonModule {
    frameworkName: "Growl"
}

//Module {
//    Depends { name: "cpp" }
//    Probes.FrameworkProbe {
//        id: probe
//        names: "Growl"
//    }

//    condition: {
//        if (qbs.targetOS === "mac" && probe.found)
//            return true;
//        else
//            return false;
//    }
//    cpp.frameworks: "Growl"
//    cpp.frameworkPaths: probe.path
//}
