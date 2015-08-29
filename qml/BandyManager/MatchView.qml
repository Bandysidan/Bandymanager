import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0


Rectangle {
    id: matchView
    z:20
    anchors.fill: parent
    Image {
        id: logo
        x: 110
        y: 10
        width: 235
        height: 142
        fillMode: Image.PreserveAspectFit
        source: "BMlogo.png"
    }

    Rectangle {
        x: 0
        y: 0
        width: 106
        height: 1000

        gradient: Gradient { // This sets a vertical gradient fill
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 1.0; color: "darkgrey" }
        }
        Column {
            width: 100
            height: 990
            anchors.centerIn: parent
            spacing: 3

            BandyManager.MainGameButton {
                id: matchStart
                text: "Starta matchen"
                onClicked: {
                    matchTactic.hide();
                    matchPlay.show();
                    matchStart.hide();
                    matchPlay.startTime();
                }
            }
            BandyManager.MainGameButton {
                id: secondHalfStart
                text: "2:a halvlek"
                visible: false
                onClicked: {
                    secondHalfStart.hide();
                    matchPlay.startTime();
                }
            }
            BandyManager.MainGameButton {
                id: matchEnd
                text: "Avsluta matchen"
                visible: false
                onClicked: {
                    matchStart.show();
                    secondHalfStart.hide();
                    matchEnd.hide();
                    matchPlay.hide();
                    matchView.hide();

                }
            }

        }
    }
    Rectangle {
       x: 108
       y: 154
       width:1000
       height: 900
       BandyManager.MatchTactic {
           id: matchTactic
           visible: false
       }
       BandyManager.MatchPlay {
           id: matchPlay
           visible: false
       }
    }


    function show() {
        matchView.visible = true;
        matchTactic.show();
    }

    function hide() {
        matchView.visible = false;
    }

}
