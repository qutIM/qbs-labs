import qbs.base 1.0

Module {
    condition: qbs.targetOS === "mac"
    Depends { name: "cpp" }
    cpp.frameworks: "Carbon"
}
