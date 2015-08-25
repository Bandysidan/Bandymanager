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
        Text{ text: "Truppen" }
        Text {
            id: teamPlayers
            text: "Lagets spelare"
            font.bold: true
        }
        Rectangle{
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


        function show() {
            mainGameSquad.visible = true;
            gamerName=gamer.getName("Player1");
            gamerTeam=gamer.getTeamUid("Player1");

            playerlistTeam.clear();
             playerList=player.getPlayerUidsbyTeam(gamerTeam);
            for(i=0;i < playerList.length ; i++)
                {
                    playerNumber=i.toString();
                    playerlistTeam.set(i,{name: player.getShortNameByUid(playerList[i]),number: playerNumber,playerflag: country.getFlagByUid(player.getCountryByUid(playerList[i])), agestring: player.getBirthyearByUid(playerList[i])});
                }
        }


        function hide() {
            mainGameSquad.visible = false;
        }
}
