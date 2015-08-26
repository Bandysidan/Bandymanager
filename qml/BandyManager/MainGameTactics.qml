import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager

import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id:mainGameSquad
    z:15
    property var playerList
    property var gamerName
    property var gamerTeam
    property var i
    property var playerNumber

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
        anchors.fill: parent
        Text{ text: "Välj lag och taktik" }
        Text {
            id: teamPlayers
            text: "Lagets spelare"
            font.bold: true
        }
        Rectangle{
            anchors.leftMargin: 10
            anchors.topMargin: 50
            width: 535
            height: 442
            Component {
                id: playerDelegate
                Item {
                    id: container
                    width: ListView.view.width
                    height: 24
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10

                    Rectangle {
                        id: content
                        anchors.centerIn: parent; width: container.width - 8; height: container.height - 2
                        color: "transparent"
                        antialiasing: true
                        radius: 5

                        Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#91AA9D"; antialiasing: true; radius: 3 }
                    }
                    Row {
                        anchors.centerIn: content
                        Text {
                            id: label
                            text: number +":" +name +"   "
                            color: "#193441"
                            font.pixelSize: 14
                        }
                        Image {
                            id: flag
                            width: 20
                            height: 12
                            fillMode: Image.PreserveAspectFit
                            source: playerflag
                        }
                        Text {
                            id: age
                            text: "   "+agestring
                            color: "#193441"
                            font.pixelSize: 14
                        }
                        Text {
                            id: position
                            text: "   "+positionstring
                            color: "#193441"
                            font.pixelSize: 14
                        }
                    }


                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            container.ListView.view.currentIndex = index
                            container.forceActiveFocus()
                       //     changePlayer(container.ListView.view.currentIndex)
                        }
                    }
                }

            }
            ListView {
                id: playerlistView
                anchors.fill: parent
                delegate: playerDelegate
                model: playerlistTeam
                highlight: Rectangle { color: "#772020"; radius: 5 }
                highlightFollowsCurrentItem: true

            }

        }
        ListModel {
            id: playerlistTeam
        }

        Image {
            id: pitch
            x: 800
            y: 10
            height: 800
            width: 530
            source: "pitch.png"
        }

        Image {
            id:goalkeeperImage
            x: 1035
            y: 695
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }


        Image {
            id:liberoImage
            x: 1035
            y: 595
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }


        Image {
            id:leftbackImage
            x: 935
            y: 565
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:rightbackImage
            x: 1135
            y: 565
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:lefthalfImage
            x: 815
            y: 545
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:righthalfImage
            x: 1255
            y: 545
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:midImage
            x: 1035
            y: 415
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }


        Image {
            id:leftmidImage
            x: 855
            y: 375
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:rightmidImage
            x: 1215
            y: 375
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:leftattackImage
            x: 855
            y: 175
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        Image {
            id:rightattackImage
            x: 1215
            y: 175
            height: 81
            width: 59
            source: "ShirtNonchoosen.png"
        }

        function show() {
            mainGameTactics.visible = true;
            gamerName=gamer.getName("Player1");
            gamerTeam=gamer.getTeamUid("Player1");

            playerlistTeam.clear();
             playerList=player.getPlayerUidsbyTeam(gamerTeam);
            for(i=0;i < playerList.length ; i++)
                {
                    playerNumber=i.toString();
                    playerlistTeam.set(i,{name: player.getShortNameByUid(playerList[i]),number: playerNumber,playerflag: country.getFlagByUid(player.getCountryByUid(playerList[i])), agestring: player.getBirthyearByUid(playerList[i]), positionstring:player.getBestPosition(playerList[i])});
                }
        }


        function hide() {
            mainGameTactics.visible = false;
        }
}
