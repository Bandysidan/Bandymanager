import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
//import gamer.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    /*
        Grundläggande inställningar och laddning av data
      */

    Teams {

    }

    Players {

    }
    Gamers {

    }

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

    id: newGame
    anchors.fill: parent
    z: 5
    property var iCountry: 1
    property var currentCountry: "sweden"
    property var currentGamer: "player1"
    property var currentTeam
    property var currentPlayer
    property var playerList
    property var teamList
    property var birthyear
    property var i:0
    property var playerNumber:"1"
    property var playerSkills
    property var tempVar

    /*Titel*/
    Image {
        id: logo
        x: 10
        y: 10
        width: 335
        height: 120
        fillMode: Image.PreserveAspectFit
        source: "BMlogo.png"
    }
    /*
    Text {
        id: bandy
        text: qsTr("BandyManager")
        font.pointSize: 75
        x: 10
        y: 10
    }*/
    /* Ditt namn */
    Text {
        id: namn
        text: qsTr("Ditt namn")
        x: 10
        y: 130
    }

    TextInput {
        x: 100
        y: 130
        id: input
        color: "red"
        text: "Inqognito"
        width: parent.width-16; height: 28
        focus: true
    }

    /* Val av land */

    Image {
        id: flag
        x: 100
        y: 170
        width: 235
        height: 142
        fillMode: Image.PreserveAspectFit
        Component.onCompleted: {
            source = country.getFlagByUid(currentCountry);
        }
    }
    Text {
        id: countryname
        x: 100
        y: 315
        Component.onCompleted: {
            text = country.getNameByUid(currentCountry);
        }
    }


        Image {
            id: right
            x: 355
            y: 225
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
            source: "Right.png"
            signal clicked()
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    right.source= "RightOMO.png";
                }
                onExited: {
                    right.source= "Right.png";
                }

                onClicked:{
                    countryRight();
                    changeCountry();
                }

            }
        }


        Image {
            id: left
            x: 55
            y: 225
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
            source: "Left.png"
            signal clicked()
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    left.source= "LeftOMO.png";
                }

                onExited: {
                    left.source= "Left.png";
                }
                onClicked:{
                    countryLeft();
                    changeCountry();
                }
            }
        }

    /* Vallista för lag */
    Text {
        id: chooseTeam
        x: 300
        y: 395
        text: "Välj lag:"
        font.bold: true
    }
    Rectangle{
        x: 300
        y: 415
        width: 235
        height: 442
        Component {
            id: teamDelegate
            Item {
                id: container
                width: ListView.view.width; height: 30; anchors.leftMargin: 10; anchors.rightMargin: 10

                Rectangle {
                    id: content
                    anchors.centerIn: parent; width: container.width - 40; height: container.height - 10
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#91AA9D"; antialiasing: true; radius: 8 }
                }

                Text {
                    id: label
                    anchors.centerIn: content
                    text: name
                    color: "#193441"
                    font.pixelSize: 14
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        container.ListView.view.currentIndex = index
                        container.forceActiveFocus()
                        changeTeam(container.ListView.view.currentIndex)
                    }
                }
            }

        }
        ListView {
            id: teamslist
            anchors.fill: parent
            delegate: teamDelegate
            model: teamlistModel
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            highlightFollowsCurrentItem: true

        }

    }

    ListModel {
        id: teamlistModel

    }

    /* Vallista spelare */
    Text {
        id: teamPlayers
        x: 570
        y: 395
        text: "Lagets spelare"
        font.bold: true
    }

    Rectangle{
        x: 570
        y: 415
        width: 235
        height: 442
        Component {
            id: playerDelegate
            Item {
                id: container
                width: ListView.view.width; height: 30; anchors.leftMargin: 10; anchors.rightMargin: 10

                Rectangle {
                    id: content
                    anchors.centerIn: parent; width: container.width - 40; height: container.height - 10
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#91AA9D"; antialiasing: true; radius: 8 }
                }

                Text {
                    id: label
                    anchors.centerIn: content
                    //anchors.left: content
                    text: number +":" +name
                    color: "#193441"
                    font.pixelSize: 14
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        container.ListView.view.currentIndex = index
                        container.forceActiveFocus()
                        changePlayer(container.ListView.view.currentIndex)
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

    /* Spelarinformation */

    Text {
        id: playerInfo
        x: 840
        y: 395
        text: "Spelarinformation"
        font.bold: true
    }
    Text {
        id: playerName
        x: 840
        y: 410
        text: "Torbjörn Lindquist"
        font.bold: false
    }

    Text {
        id: saveText
        x: 840
        y: 435
        text: "Räddning: "
        font.bold: true
    }
    Text {
        id: saveValue
        x: 945
        y: 435
        text: ""
        font.bold: false
    }
    Text {
        id: throwText
        x: 840
        y: 450
        text: "Utkast: "
        font.bold: true
    }
    Text {
        id: throwValue
        x: 945
        y: 450
        text: ""
        font.bold: false
    }
    Text {
        id: skatingText
        x: 840
        y: 465
        text: "Skridskoåkning: "
        font.bold: true
    }
    Text {
        id: skatingValue
        x: 945
        y: 465
        text: ""
        font.bold: false
    }
    Text {
        id: interceptText
        x: 840
        y: 480
        text: "Brytning: "
        font.bold: true
    }
    Text {
        id: interceptValue
        x: 945
        y: 480
        text: ""
        font.bold: false
    }
    Text {
        id: passingText
        x: 840
        y: 495
        text: "Passning: "
        font.bold: true
    }
    Text {
        id: passingValue
        x: 945
        y: 495
        text: ""
        font.bold: false
    }
    Text {
        id: lyrText
        x: 840
        y: 510
        text: "Lyrboll: "
        font.bold: true
    }
    Text {
        id: lyrValue
        x: 945
        y: 510
        text: ""
        font.bold: false
    }
    Text {
        id: takedownText
        x: 840
        y: 525
        text: "Nedtagning: "
        font.bold: true
    }
    Text {
        id: takedownValue
        x: 945
        y: 525
        text: ""
        font.bold: false
    }
    Text {
        id: takingText
        x: 840
        y: 540
        text: "Mottagning: "
        font.bold: true
    }
    Text {
        id: takingValue
        x: 945
        y: 540
        text: ""
        font.bold: false
    }
    Text {
        id: dribblingText
        x: 840
        y: 555
        text: "Dribbling: "
        font.bold: true
    }
    Text {
        id: dribblingValue
        x: 945
        y: 555
        text: ""
        font.bold: false
    }
    Text {
        id: aggressionText
        x: 840
        y: 570
        text: "Aggresivitet: "
        font.bold: true
    }
    Text {
        id: aggressionValue
        x: 945
        y: 570
        text: ""
        font.bold: false
    }
    Text {
        id: konditionText
        x: 840
        y: 585
        text: "Kondition: "
        font.bold: true
    }
    Text {
        id: konditionValue
        x: 945
        y: 585
        text: ""
        font.bold: false
    }
    Image {
        id: playerFlag
        x: 1050
        y: 410
        width: 59
        height: 36
        fillMode: Image.PreserveAspectFit
        Component.onCompleted: {
            source = country.getFlagByUid(currentCountry);

        }
    }
    Text {
        id: ageText
        x: 1050
        y: 500
        text: "Ålder: "
        font.bold: true
    }
    Text {
        id: ageValue
        x: 1155
        y: 500
        text: ""
        font.bold: false
    }

    Rectangle{
        x:1050
        y: 650
        width: 250
        height: 250
        BandyManager.MainMenuButton {
            text: "Starta spelet"
            onClicked: {
                newGame.visible = false;
                mainGameScreen.show();
            }
        }

    }


    Component.onCompleted: {
        changeCountry();
    }

    function show() {
        newGame.visible = true;
    }

    function countryRight() {
        if(currentCountry=="sweden")
               currentCountry="russia"
        else if(currentCountry=="russia")
            currentCountry="finland"
        else if(currentCountry=="finland")
            currentCountry="norway"
        else if(currentCountry=="norway")
            currentCountry="usa"
        else
            currentCountry="sweden"
//currentCountry = country.getNextByUid(currentCountry);
    }

    function countryLeft() {
        if(currentCountry=="sweden")
               currentCountry="usa"
        else if(currentCountry=="usa")
            currentCountry="norway"
        else if(currentCountry=="norway")
            currentCountry="finland"
        else if(currentCountry=="finland")
            currentCountry="russia"
        else
            currentCountry="sweden"

    }

    function changeCountry() {
        teamList = team.getUidByCountryUid(currentCountry);
        flag.source= country.getFlagByUid(currentCountry);
        countryname.text= country.getNameByUid(currentCountry);
        teamlistModel.clear();
        for(i=0; i < teamList.length ; i++)
            {
                teamlistModel.set(i,{name: team.getNameByUid(teamList[i])})
            }
        changeTeam(0);
    }


    function changeTeam(teamindex){
        playerlistTeam.clear();
        currentTeam = teamList[teamindex];
        playerList=player.getPlayerUidsbyTeam(currentTeam);
        for(i=0;i < playerList.length ; i++)
            {
                playerNumber=i.toString();
                playerlistTeam.set(i,{name: player.getShortNameByUid(playerList[i]),number: playerNumber});
            }
        changePlayer(0);
    }


    function changePlayer(playerindex){
        currentPlayer = playerList[playerindex];
        playerName.text = player.getFullNameByUid(currentPlayer);
        playerSkills = player.getSkillsByUid(currentPlayer);
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
        konditionValue.text = parseInt((playerSkills[10]-1)/10+1);
        tempVar=player.getCountryByUid(currentPlayer);
        playerFlag.source = country.getFlagByUid(tempVar);
        birthyear=player.getBirthyearByUid(currentPlayer);
        if(birthyear>0)
            ageValue.text = 2015-birthyear;
        else
            ageValue.text = "";
    }
}
