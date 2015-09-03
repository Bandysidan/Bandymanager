import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager

import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0


Rectangle {

    id:mainGameHome
    z: 10
    anchors.fill: parent
    Text{
        id: namn
        text: ""
    }

    Component.onCompleted: {

    }

    function show() {
        mainGameHome.visible = true;
        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        //namn.text=gamerName.concat(" är ny tränare för ",team.getNameByUid(gamerTeam),". ",String(mainGame.year),String(mainGame.month),String(mainGame.day));
        namn.text=mainGame.getShortDate("blabla");
    }


    function hide() {
        mainGameHome.visible = false;
    }
}


