import qbs.base 1.0
import "../DbusMenuModule.qbs" as DbusMenuModule

DbusMenuModule {
    Depends { name: 'qt.dbus' }
}
