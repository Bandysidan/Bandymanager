#include <QtGui>
#include <QtQml>

#include "country.h"
#include "player.h"
#include "team.h"
#include "gamer.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Country>("linkan.bandymanager",1,0,"Country");

    qmlRegisterType<Gamer>("linkan.bandymanager",1,0,"Gamer");

    qmlRegisterType<Player>("players.bandymanager",1,0,"Player");

    qmlRegisterType<Team>("team.bandymanager",1,0,"Team");

    engine.load(QUrl(QStringLiteral("qrc:///qml/BandyManager/Countries.qml")));


    engine.load(QUrl(QStringLiteral("qrc:///qml/BandyManager/main.qml")));


    return app.exec();
}
