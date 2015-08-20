import QtQuick 2.0

import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: newGame
    anchors.fill: parent
    z: 5
    property var iCountry: 1
    property var currentCountry: "sweden"

    Text {
        id: bandy
        text: qsTr("BandyManager")
        font.pointSize: 75
        x: 10
        y: 10
    }


    Teams {

    }

    Players {

    }
    Countries {

    }
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
    Country {
        id: country
    }
    Team {
        id: team
    }
    Player {
        id: player
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
                    }
                }
            }

        }
        ListView {
            id: teamslist
            anchors.fill: parent
            delegate: teamDelegate
            model: teamlistSweden
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            highlightFollowsCurrentItem: true

        }

    }

    ListModel {
        id: teamlistSweden
        ListElement{name: "Sandvikens AIK"}
        ListElement{name: "Västerås SK"}
        ListElement{name: "Hammarby IF"}
        ListElement{name: "Villa Lidköping BK"}
    }

    ListModel {
        id: teamlistRussia
        ListElement{name: "Dynamo Moskva"}
        ListElement{name: "Jenisej"}
    }

    ListModel {
        id: teamlistNorway
        ListElement{name: "Stabaek"}
        ListElement{name: "Ready"}
    }

    ListModel {
        id: teamlistFinland
        ListElement{name: "IFK Helsinki"}
        ListElement{name: "OLS"}
    }

    ListModel {
        id: teamlistUSA
        ListElement{name: "Dinkytown Dukes"}
        ListElement{name: "Minneapolis Bandolier"}
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
                    }
                }
            }

        }
        ListView {
            id: playerlist
            anchors.fill: parent
            delegate: playerDelegate
            model: playerlistSAIK
            highlight: Rectangle { color: "#772020"; radius: 5 }
            highlightFollowsCurrentItem: true

        }

    }
    ListModel {
        id: playerlistSAIK
        ListElement{name: "Magnus Muhren"
            number: "2"}
        ListElement{name: "Stefan Andersson"
            number: "5"}
    }

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

    Text {
        id: chooseTeam
        x: 300
        y: 395
        text: "Välj lag:"
        font.bold: true
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
        if(currentCountry=="sweden")
            {
                teamslist.model= teamlistSweden;
            playerlistSAIK.set(0,{name: "Magnus Muhrén",number: "13"});
                playerlistSAIK.set(1,{name: "Torbjörn Lindquist",number: "47"});
                playerlistSAIK.set(2,{name:"Jonas Pettersson",number: "54"})
            }
        else if(currentCountry=="usa")
        {
          teamslist.model= teamlistUSA;
            playerlistSAIK.set(0,{name: "Scott Manson",number: "17"});
            playerlistSAIK.set(1,{name: "Mike Harrington",number: "19"});
        }
        else if(currentCountry=="norway")
        {
                    teamslist.model= teamlistNorway;
            playerlistSAIK.set(0,{name: "Pål Hansen",number: "7"});
            playerlistSAIK.set(1,{name: "Aleksander Cras",number: "11"});
        }
        else if(currentCountry=="finland")
        {
                      teamslist.model= teamlistFinland;
        playerlistSAIK.set(0,{name: "Mikka Muttikainen",number: "4"});
        playerlistSAIK.set(1,{name: "Sami Laakkonen",number: "22"});
        }
        else
        {
            teamslist.model= teamlistRussia;
            playerlistSAIK.set(0,{name: "Misha Sveshnikov",number: "9"});
            playerlistSAIK.set(1,{name: "Maxim Potechkin",number: "27"});
            playerlistSAIK.remove(2)
        }
//        playername.text=country.getMaleName(currentCountry);
//        playername.text=player.getFirstNameByUid("x01x01x02");


    }


}
