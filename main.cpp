#include <QCoreApplication>
#include <QtCrypto>
#include "zlib.h"

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QCA::Initializer init;
    qDebug("Hello world!");
    return 0;
}

