import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    z:20
    anchors.fill: parent

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
    Game {
        id: mainGame
    }
    Serie {
        id: serie
    }
    Match {
        id: match
    }

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
                text: "Hem"
                onClicked: {
                    mainGameHome.show();
                    mainGameSquad.hide();
                    mainGameTactics.hide();
                    mainGamePlayedMatches.hide();
                    mainGameTable.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Truppen"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.show();
                    mainGameTactics.hide();
                    mainGamePlayedMatches.hide();
                    mainGameTable.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Taktik"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.hide();
                    mainGameTactics.show();
                    mainGamePlayedMatches.hide();
                    mainGameTable.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Matcher"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.hide();
                    mainGameTactics.hide();
                    mainGamePlayedMatches.show();
                    mainGameTable.hide();
                }
            }

            BandyManager.MainGameButton {
                text: "Tabell"
                onClicked: {
                    mainGameHome.hide();
                    mainGameSquad.hide();
                    mainGameTactics.hide();
                    mainGamePlayedMatches.hide();
                    mainGameTable.show();
                }
            }

            BandyManager.MainGameButton {
                id: nextMatch
                text: "Nästa match"
                onClicked: {
                     matchView.show();
                     mainGameHome.update();
                    mainGameHome.show();
                    mainGameSquad.hide();
                    mainGameTactics.hide();
                    mainGamePlayedMatches.hide();
                    mainGameTable.hide();
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
       BandyManager.MainGamePlayedMatches {
           id: mainGamePlayedMatches
           visible: false
       }
       BandyManager.MainGameTable {
           id: mainGameTable
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
