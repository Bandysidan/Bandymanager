import QtQuick 2.0

import linkan.bandymanager 1.0
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
    Country {
        id: country
    }
    Team {
        id: team
    }
    Player {
        id: player
    }

    id: newGame
    anchors.fill: parent
    z: 5
    property var iCountry: 1
    property var currentCountry: "sweden"
    property var currentTeam: "SAIKbandyherrar"
    property var currentPlayer: "x01x01x01"
    property var playerList:["x01x01x01","x01x01x02","x01x01x03","x01x01x04","x01x01x05","x01x01x06"]
    property var teamListSweden: ["SAIKbandyherrar","VSKbandyherrar","Bajenbandyherrar","Villabandyherrar","Tillbergabandyherrar"]
    property var teamListRussia: ["Jenisejherrar","Dynamomoscowherrar","Vodnikherrar"]
    property var teamListNorway: ["Stabaekherrar","Mjöndalenherrar","Readyherrar"]
    property var teamListUSA: ["Dinkytownherrar","Bandolierherrar"]
    property var teamListFinland: ["Helsinkiherrar","OLSherrar"]
    property var i:0
    property var playerNumber:"1"

    /*Titel*/
    Text {
        id: bandy
        text: qsTr("BandyManager")
        font.pointSize: 75
        x: 10
        y: 10
    }
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
                    text: name +" (" + (index + 1)+")"
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





    Component.onCompleted: changeCountry();

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
        flag.source= country.getFlagByUid(currentCountry);
        countryname.text= country.getNameByUid(currentCountry);
        playerlistTeam.clear();
        if(currentCountry=="sweden")
            {
                teamlistModel.clear();
                for(i=0; i < teamListSweden.length ; i++)
                    {
                        teamlistModel.set(i,{name: team.getNameByUid(teamListSweden[i])})
                    }
            }
        else if(currentCountry=="usa")
            {
            teamlistModel.clear();
            for(i=0; i < teamListUSA.length ; i++)
                {
                    teamlistModel.set(i,{name: team.getNameByUid(teamListUSA[i])})
                }
            }
        else if(currentCountry=="norway")
            {
                teamlistModel.clear();
                for(i=0; i < teamListNorway.length ; i++)
                    {
                        teamlistModel.set(i,{name: team.getNameByUid(teamListNorway[i])})
                    }
            }
        else if(currentCountry=="finland")
            {
            teamlistModel.clear();
            for(i=0; i < teamListSweden.length ; i++)
                {
                    teamlistModel.set(i,{name: team.getNameByUid(teamListFinland[i])})
                }
            }
        else
            {
                teamlistModel.clear();
                for(i=0; i < teamListRussia.length ; i++)
                    {
                        teamlistModel.set(i,{name: team.getNameByUid(teamListRussia[i])})
                    }

            }
//        playername.text=country.getMaleName(currentCountry);
//        playername.text=player.getFirstNameByUid("x01x01x02");

        changeTeam(1);
    }


    function changeTeam(teamindex){
        playerlistTeam.clear();
        if(currentCountry=="sweden")
            {
                currentTeam = teamListSweden[teamindex];
                for(i=0;i < playerList.length ; i++)
                    {
                        playerNumber=i.toString();
                        playerlistTeam.set(i,{name: player.getShortNameByUid(playerList[i]),number: playerNumber});
                    }

            }
        else if(currentCountry=="usa")
            {
                playerlistTeam.clear();
                playerlistTeam.set(0,{name: "Scott Manson",number: "17"});
                playerlistTeam.set(1,{name: "Mike Harrington",number: "19"});
            }
        else if(currentCountry=="norway")
            {
                playerlistTeam.clear();
                playerlistTeam.set(0,{name: "Pål Hansen",number: "7"});
                playerlistTeam.set(1,{name: "Aleksander Cras",number: "11"});
            }
        else if(currentCountry=="finland")
            {
                playerlistTeam.clear();
                playerlistTeam.set(0,{name: "Mikka Muttikainen",number: "4"});
                playerlistTeam.set(1,{name: "Sami Laakkonen",number: "22"});
            }
        else
            {
                currentTeam = teamListRussia[teamindex];
                playerlistTeam.clear();
                playerlistTeam.set(0,{name: "Misha Sveshnikov",number: "9"});
                playerlistTeam.set(1,{name: "Maxim Potechkin",number: "27"});
            }


    }


    function changePlayer(playerindex){
        currentPlayer = playerList[playerindex];
        playerName.text = player.getFullNameByUid(currentPlayer);
        //playerName.text = currentPlayer;
    }
}
