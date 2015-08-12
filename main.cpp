#include <QtGui>
#include <QtQml>

#include "country.h"
#include "player.h"
#include "team.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Country>("linkan.bandymanager",1,0,"Country");

    qmlRegisterType<Team>("team.bandymanager",1,0,"Team");

    engine.load(QUrl(QStringLiteral("qrc:///qml/BandyManager/main.qml")));


    return app.exec();
}
