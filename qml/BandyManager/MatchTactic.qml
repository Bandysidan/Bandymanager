import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: matchTactic
    z: 25
       anchors.fill: parent

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

    property string homeTeam: "SAIKbandyherrar"
    property string awayTeam: "Edsbynherrar"

    Text {
        text: "Taktiksida"
    }
    Text {
        x: 140
        y: 25
        text: team.getNameByUid(homeTeam)
    }
    Text {
        x: 940
        y: 25
        text: team.getNameByUid(awayTeam)
    }

    Image {
        id: pitchHome
        x: 140
        y: 40
        height: 800
        width: 530
        source: "pitch.png"
    }

    Image {
        id: pitchAway
        x: 940
        y: 40
        height: 800
        width: 530
        source: "pitch.png"
    }


    function show() {
        matchTactic.visible = true;
    }

    function hide() {
        matchTactic.visible = false;
    }

}
