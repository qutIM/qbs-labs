#include <QCoreApplication>
#include <QtCrypto>
#include <zlib.h>
#include <libotr/auth.h>
#ifdef Q_OS_LINUX
#include <aspell.h>
#include <hunspell/hunspell.hxx>
#include <kio_export.h>
#include <knotify_export.h>
#endif

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QCA::Initializer init;
    qDebug("Hello world!");
    return 0;
}

