#include <QCoreApplication>
#include <QtCrypto>

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QCA::Initializer init;
    qDebug("Hello world!");
    return 0;
}

