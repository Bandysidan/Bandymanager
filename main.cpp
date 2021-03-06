#include <QtGui>
#include <QtQml>
#include <ctime>

#include "country.h"
#include "player.h"
#include "team.h"
#include "game.h"
#include "gamer.h"
#include "match.h"
#include "serie.h"
#include "news.h"


int main(int argc, char *argv[])
{
    srand(time(0));
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Country>("linkan.bandymanager",1,0,"Country");

    qmlRegisterType<Gamer>("linkan.bandymanager",1,0,"Gamer");

    qmlRegisterType<Match>("linkan.bandymanager",1,0,"Match");

    qmlRegisterType<Game>("linkan.bandymanager",1,0,"Game");

    qmlRegisterType<Serie>("linkan.bandymanager",1,0,"Serie");

    qmlRegisterType<News>("linkan.bandymanager",1,0,"News");

    qmlRegisterType<Player>("players.bandymanager",1,0,"Player");

    qmlRegisterType<Team>("team.bandymanager",1,0,"Team");

    engine.load(QUrl(QStringLiteral("qrc:///qml/BandyManager/Countries.qml")));


    engine.load(QUrl(QStringLiteral("qrc:///qml/BandyManager/main.qml")));


    return app.exec();
}
