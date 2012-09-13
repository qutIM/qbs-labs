import qbs.base 1.0
import "CommonModule.qbs" as CommonModule

CommonModule {
    property string moduleName

    includeSuffix: ['SDL']
    libraryNames: "SDL_" + moduleName
    includeNames: "SDL_" +moduleName + ".h"

    Depends { name: 'sdl' }
}

