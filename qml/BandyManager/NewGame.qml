import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
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
    Gamers {

    }
    Matches{

    }
    Series{

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
    Serie{
        id: serie
    }

    Game {
        id: mainGame
        uid: "mainGame"
        day: 10
        month: 9
        year: 2015
    }

    id: newGame
    anchors.fill: parent
    z: 5
    property int iCountry: 1
    property string currentCountry: "sweden"
    property string currentSeries
    property string currentGamer: "Player1"
    property var currentTeam
    property var currentPlayer
    property var playerList
    property var teamList
    property var serieList
    property var birthyear
    property int i:0
    property string playerNumber:"1"
    property var playerSkills
    property var positionSkills
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

    /* Vallista för serier */
    Text {
        id: chooseSerie
        x: 20
        y: 395
        text: "Välj serie:"
        font.bold: true
    }
    Rectangle{
        x: 20
        y: 415
        width: 235
        height: 442
        Component {
            id: serieDelegate
            Item {
                id: container
                width: ListView.view.width; height: 24; anchors.leftMargin: 10; anchors.rightMargin: 10

                Rectangle {
                    id: content
                    anchors.centerIn: parent; width: container.width - 4; height: container.height - 2
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "yellowgreen"; antialiasing: true; radius: 3 }
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
                        changeSeries(container.ListView.view.currentIndex)
                    }
                }
            }

        }
        ListView {
            id: serielist
            anchors.fill: parent
            delegate: serieDelegate
            model: serielistModel
            highlight: Rectangle { color: "darkgreen"; radius: 5 }
            highlightFollowsCurrentItem: true

        }

    }

    ListModel {
       id: serielistModel
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
                width: ListView.view.width; height: 24; anchors.leftMargin: 10; anchors.rightMargin: 10

                Rectangle {
                    id: content
                    anchors.centerIn: parent; width: container.width - 4; height: container.height - 2
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "yellowgreen"; antialiasing: true; radius: 3 }
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
            highlight: Rectangle { color: "darkgreen"; radius: 5 }
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
                width: ListView.view.width; height: 24; anchors.leftMargin: 10; anchors.rightMargin: 10

                Rectangle {
                    id: content
                    anchors.centerIn: parent; width: container.width - 4; height: container.height - 4
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "yellowgreen"; antialiasing: true; radius: 3 }
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
            highlight: Rectangle { color: "darkgreen"; radius: 5 }
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
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
        x: 960
        y: 570
        text: ""
        font.bold: false
    }
    Text {
        id: shotHardnessText
        x: 840
        y: 585
        text: "Skott (Hårdhet): "
        font.bold: true
    }
    Text {
        id: shotHardnessValue
        x: 960
        y: 585
        text: ""
        font.bold: false
    }
    Text {
        id: shotPrecissionText
        x: 840
        y: 600
        text: "Skott (Precission): "
        font.bold: true
    }
    Text {
        id: shotPrecissionValue
        x: 960
        y: 600
        text: ""
        font.bold: false
    }
    Text {
        id: konditionText
        x: 840
        y: 615
        text: "Kondition: "
        font.bold: true
    }
    Text {
        id: konditionValue
        x: 960
        y: 615
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
    Text {
        id: ratingText
        x: 1050
        y: 525
        text: "Ranking"
        font.bold: true
    }
    Text {
        id: goalkeeperText
        x: 1050
        y: 545
        text: "Målvakt: "
        font.bold: true
    }
    Text {
        id: goalkeeperValue
        x: 1155
        y: 545
        text: ""
        font.bold: false
    }
    Text {
        id: liberoText
        x: 1050
        y: 560
        text: "Libero: "
        font.bold: true
    }
    Text {
        id: liberoValue
        x: 1155
        y: 560
        text: ""
        font.bold: false
    }
    Text {
        id: defenderText
        x: 1050
        y: 575
        text: "Back: "
        font.bold: true
    }
    Text {
        id: defenderValue
        x: 1155
        y: 575
        text: ""
        font.bold: false
    }
    Text {
        id: halfbackText
        x: 1050
        y: 590
        text: "Halv: "
        font.bold: true
    }
    Text {
        id: halfbackValue
        x: 1155
        y: 590
        text: ""
        font.bold: false
    }
    Text {
        id: midfieldText
        x: 1050
        y: 605
        text: "Mittfältare: "
        font.bold: true
    }
    Text {
        id: midfieldValue
        x: 1155
        y: 605
        text: ""
        font.bold: false
    }
    Text {
        id: attackerText
        x: 1050
        y: 620
        text: "Anfallare: "
        font.bold: true
    }
    Text {
        id: attackerValue
        x: 1155
        y: 620
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

                gamer.setTeamUidStart(currentTeam,currentGamer);
                gamer.setNameStart(input.text,currentGamer);
                team.autoPositions(currentTeam);
                newGame.visible = false;
                mainGameScreen.show();
            }
        }

    }


    Component.onCompleted: {
        team.fillTeams();
        changeCountry();
    }

    function show() {
        newGame.visible = true;
        serie.makeSchedule("USADivision1");
        serie.makeSchedule("SwedenElitserien");
        serie.makeSchedule("SwedenAllsvSodra");
        serie.makeSchedule("FinlandBandyliiga");
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

    function changeSeries(seriesindex) {
        //teamList = team.getUidByCountryUid(currentCountry);
        currentSeries=serieList[seriesindex];
        teamList = serie.getTeamsByUid(currentSeries);
        teamlistModel.clear();
        for(i=0; i < teamList.length ; i++)
            {
                teamlistModel.set(i,{name: team.getNameByUid(teamList[i])})
            }
        changeTeam(0);
    }

    function changeCountry() {
        flag.source= country.getFlagByUid(currentCountry);
        countryname.text= country.getNameByUid(currentCountry);

        serieList = serie.getUidByCountryUid(currentCountry);
//        console.log(serieList.length);
        serielistModel.clear();
        for(i=0; i < serieList.length ; i++)
            {

                serielistModel.set(i,{name: serie.getNameByUid(serieList[i])})
            }

        changeSeries(0);
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
        goalkeeperValue.text=parseInt((positionSkills[0]-1)/10+1);
        liberoValue.text=parseInt((positionSkills[1]-1)/10+1);
        defenderValue.text=parseInt((positionSkills[2]-1)/10+1);
        halfbackValue.text=parseInt((positionSkills[3]-1)/10+1);
        midfieldValue.text=parseInt((positionSkills[4]-1)/10+1);
        attackerValue.text=parseInt((positionSkills[5]-1)/10+1);
        if(birthyear>0)
            ageValue.text = 2015-birthyear;
        else
            ageValue.text = "";
    }
}
