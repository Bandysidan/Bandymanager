import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager

import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0


Rectangle {

    property var gamerName
    property var gamerTeam

    Country {
        id: country
    }
    Team {
        id: team
    }
    Player {
        id: player
    }
    Gamer {
        id: gamer
    }
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
        namn.text=gamerName.concat(" är ny tränare för ",team.getNameByUid(gamerTeam));
    }


    function hide() {
        mainGameHome.visible = false;
    }
}


