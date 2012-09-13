import qbs.base 1.0
import "../CommonModule.qbs" as CommonModule

CommonModule {
    includeSuffix: ['SDL']
    libraryNames: 'SDL'
    includeNames: 'SDL_version.h'
    pkgConfigName: "sdl"
}

