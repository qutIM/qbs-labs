#include <QCoreApplication>
#include </usr/local/lib/qca.framework/Headers/QtCrypto>

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QCA::Initializer init;
    qDebug("Hello world!");
    return 0;
}

