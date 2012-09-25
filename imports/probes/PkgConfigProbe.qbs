import qbs.base 1.0
import qbs.fileinfo as FileInfo
import "utils.js" as Utils

Probe {
    // Inputs
    property string executable: 'pkg-config'
    property string name
    property string minVersion
    property string exactVersion
    property string maxVersion

    // Output
    property var cflags
    property paths libraryPaths
    property paths dynamicLibraries
    property paths includePaths
    property var linkerFlags

    //internal
    function splitPaths(paths, separator) {
        if (paths === '')
            return undefined;
        paths = paths.slice(separator.length);
        return paths.split(' ' + separator);
    }

    configure: {
        if (!name)
            throw '"name" must be specified';
        found = false;
        cflags = undefined;
        libraryPaths = undefined;

        var p = new Process();
        var args = [ name ];
        if (minVersion !== undefined)
            args.push(name + ' >= ' + minVersion);
        if (exactVersion !== undefined)
            args.push(name + ' = ' + exactVersion);
        if (maxVersion !== undefined)
            args.push(name + ' <= ' + maxVersion);

        if (p.exec(executable, args.concat([ '--libs-only-L' ])) === 0) {
            libraryPaths = splitPaths(p.readAll().trim(), '-L');
        }
        if (p.exec(executable, args.concat([ '--libs-only-l' ])) === 0) {
            dynamicLibraries = splitPaths(p.readAll().trim(), '-l');
        }
        if (p.exec(executable, args.concat([ '--libs-only-other' ])) === 0) {
            linkerFlags = p.readAll().trim();
        }

        if (p.exec(executable, args.concat([ '--cflags-only-I' ])) === 0) {
            includePaths = splitPaths(p.readAll().trim(), '-I');
        }
        if (p.exec(executable, args.concat([ '--cflags-only-other' ])) === 0) {
            cflags = p.readAll().trim();
            if (cflags === "")
                cflags = cflags.split(/\s/);
        }

        if (dynamicLibraries) {
            print("PkgConfigProbe: found library " + name);
            found = true;
        }

        //if (p.exec(executable, args.concat([ '--cflags' ])) === 0) {
        //    cflags = p.readAll().trim();
        //    if (cflags === "")
        //        cflags = undefined;
        //    else
        //        cflags = cflags.split(/\s/);
        //    if (p.exec(executable, args.concat([ '--libs' ])) === 0) {
        //        libs = p.readAll().trim();
        //        if (libs === "")
        //            libs = undefined;
        //        else
        //            libs = libs.split(/\s/);
        //        found = true;
        //        print("PkgConfigProbe: found library " + name);
        //        return;
        //    }
        //}

    }
}
