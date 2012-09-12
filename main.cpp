#include <QCoreApplication>
#include <QtCrypto>
#include <zlib.h>
#ifdef Q_OS_LINUX
#include <libotr/auth.h>
#include <aspell.h>
#include <hunspell/hunspell.hxx>
#include <kio_export.h>
#include <KGlobal>
#endif

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QCA::Initializer init;
    qDebug("Hello world!");
    return 0;
}

