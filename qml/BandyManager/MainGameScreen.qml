import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
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

    Gamer {
        id: gamer
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
                text: "Hem"
                onClicked: {
                    mainGameHome.show();
                    mainGameSquad.hide();
                    mainGameTactics.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Truppen"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.show();
                    mainGameTactics.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Taktik"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.hide();
                    mainGameTactics.show();
                }
            }

            BandyManager.MainGameButton {
                text: "Nästa match"
                onClicked: {
                    //if(gamer.getTeamUid("Player1")==="SAIKbandyherrar" || gamer.getTeamUid("Player1")==="Edsbynherrar"){
                        matchView.show();
                    //}
                }
            }
            Rectangle {
                width: 100
                height: 150
                opacity: 0
            }

            BandyManager.MainGameButton {
                text: "Avsluta"
                onClicked: Qt.quit()
            }

        }
    }
    Rectangle {
       x: 108
       y: 154
       width:1000
       height: 900
       BandyManager.MainGameHome {
           id: mainGameHome
           visible: false
       }
       BandyManager.MainGameSquad {
           id: mainGameSquad
           visible: false
       }
       BandyManager.MainGameTactics {
           id: mainGameTactics
           visible: false
       }
    }



    function show() {
       // newGame.visible = false;
        mainGameScreen.visible = true;
        mainGameHome.show();
    }

}
