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

    BandyManager.MatchShirt {
        id: homegoalkeeperShirt
        pos: 0
        x: 375
        y: 725
    }

    BandyManager.MatchShirt {
        id: homeliberoShirt
        pos: 1
        x: 375
        y: 625
    }

    BandyManager.MatchShirt {
        id: homeleftdefendShirt
        pos: 2
        x: 275
        y: 595
    }

    BandyManager.MatchShirt {
        id: homerightdefendShirt
        pos: 3
        x: 475
        y: 595
    }

    BandyManager.MatchShirt {
        id: homelefthalfShirt
        pos: 4
        x: 175
        y: 575
    }

    BandyManager.MatchShirt {
        id: homerighthalfShirt
        pos: 5
        x: 575
        y: 575
    }

    BandyManager.MatchShirt {
        id: homemidShirt
        pos: 6
        x: 375
        y: 445
    }

    BandyManager.MatchShirt {
        id: homeleftmidShirt
        pos: 7
        x: 195
        y: 405
    }
    BandyManager.MatchShirt {
        id: homerightmidShirt
        pos: 8
        x: 555
        y: 405
    }

    BandyManager.MatchShirt {
        id: homeleftattackShirt
        pos: 9
        x: 275
        y: 205
    }

    BandyManager.MatchShirt {
        id: homerightattackShirt
        pos: 10
        x: 455
        y: 205
    }

    Image {
        id: pitchAway
        x: 940
        y: 40
        height: 800
        width: 530
        source: "pitch.png"
    }

    BandyManager.MatchShirt {
        id: awaygoalkeeperShirt
        pos: 100
        x: 1175
        y: 725
    }

    BandyManager.MatchShirt {
        id: awayliberoShirt
        pos:101
        x: 1175
        y: 625
    }

    BandyManager.MatchShirt {
        id: awayleftdefendShirt
        pos:102
        x: 1075
        y: 595
    }

    BandyManager.MatchShirt {
        id: awayrightdefendShirt
        pos:103
        x: 1275
        y: 595
    }

    BandyManager.MatchShirt {
        id: awaylefthalfShirt
        pos:104
        x: 975
        y: 575
    }

    BandyManager.MatchShirt {
        id: awayrighthalfShirt
        pos:105
        x: 1375
        y: 575
    }

    BandyManager.MatchShirt {
        id: awaymidShirt
        pos: 106
        x: 1175
        y: 445
    }

    BandyManager.MatchShirt {
        id: awayleftmidShirt
        pos: 107
        x: 995
        y: 405
    }
    BandyManager.MatchShirt {
        id: awayrightmidShirt
        pos: 108
        x: 1355
        y: 405
    }

    BandyManager.MatchShirt {
        id: awayleftattackShirt
        pos: 109
        x: 1075
        y: 205
    }

    BandyManager.MatchShirt {
        id: awayrightattackShirt
        pos: 110
        x: 1275
        y: 205
    }

    function show() {
        matchTactic.visible = true;
    }

    function hide() {
        matchTactic.visible = false;
    }

}
