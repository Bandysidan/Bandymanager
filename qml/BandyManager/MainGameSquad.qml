import QtQuick 2.0
import QtQuick.Controls 1.1
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
    property string playerNumber:"1"
    property var playerSkills
    property var placeList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var playedList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var wonList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var drawList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var lostList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var scoredList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var againstList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var pointList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var currentTeam

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

    ListModel {
        id: playerModel
    }

    Column {
        id: teamPlayerColumn
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once

        Text {
            id: teamPlayerHeadline
            text: " "
            font.bold: true
            font.pointSize: 16
        }
        TableView {
            id: playerListView
            width: 645
            height: 620

            TableViewColumn {
                id: playerNameColumn
                role: "playername"
                title: "Namn"
                width: 200
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: playerCountryColumn
                role: "playerCountry"
                title: "Land"
                width: 120
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: goalkeeperColumn
                role: "goalkeeperSkill"
                title: "MV"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: liberoColumn
                role: "liberoSkill"
                title: "LI"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: defenderColumn
                role: "defenderSkill"
                title: "B"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: halfColumn
                role: "halfSkill"
                title: "H"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: midfieldColumn
                role: "midfieldSkill"
                title: "MF"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: attackColumn
                role: "attackSkill"
                title: "AN"
                width: 50
                movable: false
                resizable: false
            }


            model: playerModel
        }
    }



    function show() {
        mainGameSquad.visible = true;
        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        currentTeam = gamerTeam;
        teamPlayerHeadline.text=team.getNameByUid(currentTeam);
        playerModel.clear();
        playerList=player.getPlayerUidsbyTeam(gamerTeam);
        for(i=0;i < playerList.length ; i++){
            playerSkills = player.getPositionSkills(playerList[i]);

            playerNumber=i.toString();
            playerModel.set(i,{playername: player.getFullNameByUid(playerList[i])});
            playerModel.set(i,{playerCountry: country.getNameByUid(player.getCountryByUid(playerList[i]))});
            playerModel.set(i,{goalkeeperSkill: parseInt((playerSkills[0]-1)/10+1)});
            playerModel.set(i,{liberoSkill: parseInt((playerSkills[1]-1)/10+1)});
            playerModel.set(i,{defenderSkill: parseInt((playerSkills[2]-1)/10+1)});
            playerModel.set(i,{halfSkill: parseInt((playerSkills[3]-1)/10+1)});
            playerModel.set(i,{midfieldSkill: parseInt((playerSkills[4]-1)/10+1)});
            playerModel.set(i,{attackSkill: parseInt((playerSkills[5]-1)/10+1)});

        }
    }


    function hide() {
        mainGameSquad.visible = false;
    }
}
