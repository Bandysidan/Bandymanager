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
    property string currentPlayer
    property var positionSkills
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
    property var tempVar
    property int birthyear
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

    Component {
        id: playerDelegate
        Item {
            Text {
                font.bold: true
                font.pointSize: 8
            }
        }
    }
    Component {
        id: playerNameDelegate
        Item {
            Text {
                font.bold: true
                font.pointSize: 8
            }
        }
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
            onClicked: {
                changePlayer(playerListView.currentRow);
            }
        }
    }

    Item {
        id: playerColumn
        anchors.left: teamPlayerColumn.right
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
        Text {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottomMargin: 5
            id: playerName
            text: ""
            font.bold: true
            font.pointSize: 16
        }
        Text {
            id: saveText
            anchors.left: parent.left
            anchors.top: playerName.bottom
            text: "Räddning: "
            font.bold: true
        }
        Text {
            id: saveValue
            anchors.left: parent.left
            anchors.top: playerName.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: throwText
            anchors.left: parent.left
            anchors.top: saveText.bottom
            text: "Utkast: "
            font.bold: true
        }
        Text {
            id: throwValue
            anchors.left: parent.left
            anchors.top: saveText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: skatingText
            anchors.left: parent.left
            anchors.top: throwText.bottom
            text: "Skridskoåkning: "
            font.bold: true
        }
        Text {
            id: skatingValue
            anchors.left: parent.left
            anchors.top: throwText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: interceptText
            anchors.left: parent.left
            anchors.top: skatingText.bottom
            text: "Brytning: "
            font.bold: true
        }
        Text {
            id: interceptValue
            anchors.left: parent.left
            anchors.top: skatingText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: passingText
            anchors.left: parent.left
            anchors.top: interceptText.bottom
            text: "Passning: "
            font.bold: true
        }
        Text {
            id: passingValue
            anchors.left: parent.left
            anchors.top: interceptText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: lyrText
            anchors.left: parent.left
            anchors.top: passingText.bottom
            text: "Lyrboll: "
            font.bold: true
        }
        Text {
            id: lyrValue
            anchors.left: parent.left
            anchors.top: passingText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: takedownText
            anchors.left: parent.left
            anchors.top: lyrText.bottom
            text: "Nedtagning: "
            font.bold: true
        }
        Text {
            id: takedownValue
            anchors.left: parent.left
            anchors.top: lyrText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: takingText
            anchors.left: parent.left
            anchors.top: takedownText.bottom
            text: "Mottagning: "
            font.bold: true
        }
        Text {
            id: takingValue
            anchors.left: parent.left
            anchors.top: takedownText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: dribblingText
            anchors.left: parent.left
            anchors.top: takingText.bottom
            text: "Dribbling: "
            font.bold: true
        }
        Text {
            id: dribblingValue
            anchors.left: parent.left
            anchors.top: takingText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: agressionText
            anchors.left: parent.left
            anchors.top: dribblingText.bottom
            text: "Aggresivitet: "
            font.bold: true
        }
        Text {
            id: aggressionValue
            anchors.left: parent.left
            anchors.top: dribblingText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: shotHardnessText
            anchors.left: parent.left
            anchors.top: agressionText.bottom
            text: "Skott (Hårdhet): "
            font.bold: true
        }
        Text {
            id: shotHardnessValue
            anchors.left: parent.left
            anchors.top: agressionText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: shotPrecissionText
            anchors.left: parent.left
            anchors.top: shotHardnessText.bottom
            text: "Skott (Precission): "
            font.bold: true
        }
        Text {
            id: shotPrecissionValue
            anchors.left: parent.left
            anchors.top: shotHardnessText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Text {
            id: konditionText
            anchors.left: parent.left
            anchors.top: shotPrecissionText.bottom
            text: "Kondition: "
            font.bold: true
        }
        Text {
            id: konditionValue
            anchors.left: parent.left
            anchors.top: shotPrecissionText.bottom
            anchors.leftMargin: 150
            text: ""
            font.bold: false
        }
        Image {
            id: playerFlag
            anchors.left: parent.left
            anchors.top: playerName.bottom
            anchors.leftMargin: 300
            width: 59
            height: 36
            fillMode: Image.PreserveAspectFit
            Component.onCompleted: {
                source = country.getFlagByUid("sweden");

            }
        }
        Text {
            id: ageText
            anchors.left: passingText.left
            anchors.top: passingText.top
            anchors.leftMargin: 300
            text: "Ålder: "
            font.bold: true
        }
        Text {
            id: ageValue
            anchors.left: passingText.left
            anchors.top: passingText.top
            anchors.leftMargin: 450
            text: ""
            font.bold: false
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
            //            playerModel.set(i,{playerCountry: country.getFlagByUid(player.getCountryByUid(playerList[i]))});
            playerModel.set(i,{playerCountry: country.getNameByUid(player.getCountryByUid(playerList[i]))});
            playerModel.set(i,{goalkeeperSkill: parseInt((playerSkills[0]-1)/10+1)});
            playerModel.set(i,{liberoSkill: parseInt((playerSkills[1]-1)/10+1)});
            playerModel.set(i,{defenderSkill: parseInt((playerSkills[2]-1)/10+1)});
            playerModel.set(i,{halfSkill: parseInt((playerSkills[3]-1)/10+1)});
            playerModel.set(i,{midfieldSkill: parseInt((playerSkills[4]-1)/10+1)});
            playerModel.set(i,{attackSkill: parseInt((playerSkills[5]-1)/10+1)});
        }

        changePlayer(0);
    }


    function hide() {
        mainGameSquad.visible = false;
    }

    function changePlayer(playerindex){
        currentPlayer = playerList[playerindex];
        playerName.text=player.getFullNameByUid(currentPlayer);
        playerSkills = player.getSkillsByUid(currentPlayer);
        positionSkills = player.getPositionSkills(currentPlayer);
        saveValue.text = parseInt((playerSkills[0]-1)/10+1);
        throwValue.text = parseInt((playerSkills[1]-1)/10+1);
        skatingValue.text = parseInt((playerSkills[2]-1)/10+1);
        interceptValue.text = parseInt((playerSkills[3]-1)/10+1);
        passingValue.text = parseInt((playerSkills[4]-1)/10+1);
        lyrValue.text = parseInt((playerSkills[5]-1)/10+1);
        takedownValue.text = parseInt((playerSkills[6]-1)/10+1);
        takingValue.text = parseInt((playerSkills[7]-1)/10+1);
        dribblingValue.text = parseInt((playerSkills[8]-1)/10+1);
        aggressionValue.text = parseInt((playerSkills[9]-1)/10+1);
        shotHardnessValue.text = parseInt((playerSkills[10]-1)/10+1);
        shotPrecissionValue.text = parseInt((playerSkills[11]-1)/10+1);
        konditionValue.text = parseInt((playerSkills[12]-1)/10+1);
        tempVar=player.getCountryByUid(currentPlayer);
        playerFlag.source = country.getFlagByUid(tempVar);
        birthyear=player.getBirthyearByUid(currentPlayer);
        if(birthyear>0)
            ageValue.text = 2015-birthyear;
        else
            ageValue.text = "";


    }
}
