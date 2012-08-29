import qbs.base 1.0
import "../../imports/probes" as Probes

Module {
    
    property var someProp: getVariable()
    property string executable: "uname"

    function getVariable() {
        var p = new Process();
          
        //if (p.exec("uname", [ "-a"] ) === 0) {  // Works anytime
        if (p.exec(executable, [ "-a"] ) === 0) { // Bug condition #1
            var variable = p.readAll().trim();
            return variable;
        }
    }

    Depends { name: "cpp" }

    property var _configure: {
        print(someProp); // works anytime
        return;
    }
    
    Probes.IncludeProbe {
        id: includeProbe

        platformPaths: {
            print(someProp); // Bug condition #2
            return;
        }
        names: [ "names" ]
    }
}
