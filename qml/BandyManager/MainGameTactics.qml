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
    property int i
    property int tacticsPos
    property var playerNumber
    property int playerindex: 0
    property var currentPlayer
    property var teamTactics: ["","","","","","","","","","","","","",""]
    property var homeShirt
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
                    anchors.centerIn: parent; width: container.width - 4; height: container.height - 2
                    color: "transparent"
                    antialiasing: true
                    radius: 5

                    Rectangle { anchors.fill: parent; anchors.margins: 3; color: "yellowgreen"; antialiasing: true; radius: 3 }
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
                        playerindex=container.ListView.view.currentIndex;
                        currentPlayer=playerList[playerindex];
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

        Image {
            id: pitch
            x: 800
            y: 10
            height: 800
            width: 530
            source: "pitch.png"
        }

        BandyManager.TacticShirt {
            id: goalkeeperShirt
            pos: 0
            x: 1035
            y: 695
        }

        BandyManager.TacticShirt {
            id:liberoShirt
            pos:1
            x: 1035
            y: 595
        }

        BandyManager.TacticShirt {
            id:leftdefendShirt
            pos:2
            x: 935
            y: 565
        }

        BandyManager.TacticShirt {
            id:rightdefendShirt
            pos:3
            x: 1135
            y: 565
        }

        BandyManager.TacticShirt {
            id:lefthalfShirt
            pos:4
            x: 835
            y: 545
        }

        BandyManager.TacticShirt {
            id:righthalfShirt
            pos:5
            x: 1235
            y: 545
        }

        BandyManager.TacticShirt {
            id:midShirt
            pos: 6
            x: 1035
            y: 415
        }

        BandyManager.TacticShirt {
            id:leftmidShirt
            pos: 7
            x: 855
            y: 375
        }
        BandyManager.TacticShirt {
            id:rightmidShirt
            pos:8
            x: 1215
            y: 375
        }

        BandyManager.TacticShirt {
            id:leftattackShirt
            pos:9
            x: 855
            y: 175
        }

        BandyManager.TacticShirt {
            id:rightattackShirt
            pos:10
            x: 1215
            y: 175
        }


        function show() {
            mainGameTactics.visible = true;
            gamerName=gamer.getName("Player1");
            gamerTeam=gamer.getTeamUid("Player1");
            homeShirt="shirts/"+team.getHomeShirtByUid(gamerTeam);
            getPlayers();
            playerlistTeam.clear();
             playerList=player.getPlayerUidsbyTeam(gamerTeam);
            for(i=0;i < playerList.length ; i++)
                {
                    playerNumber=i.toString();
                    playerlistTeam.set(i,{name: player.getShortNameByUid(playerList[i]),number: playerNumber,playerflag: country.getFlagByUid(player.getCountryByUid(playerList[i])), agestring: player.getBirthyearByUid(playerList[i]), positionstring:player.getBestPosition(playerList[i])});
                }
            currentPlayer=playerList[0];
            showShirts();
            //leftmidShirt.shirt=homeShirt;
        }


        function hide() {
            mainGameTactics.visible = false;
        }
        function changeShirt(tacticsPos){
            for (i=0;i<=10;i++){
                if (teamTactics[i]===currentPlayer){
                    teamTactics[i]="";
                    if(i===0){
                        team.setPosition(gamerTeam,"Goalkeeper","");
                    }else if(i===1){
                        team.setPosition(gamerTeam,"Defender1","");
                    }else if(i===2){
                        team.setPosition(gamerTeam,"Defender2","");
                    }else if(i===3){
                        team.setPosition(gamerTeam,"Defender3","");
                    }else if(i===4){
                        team.setPosition(gamerTeam,"Defender4","");
                    }else if(i===5){
                        team.setPosition(gamerTeam,"Defender5","");
                    }else if(i===6){
                        team.setPosition(gamerTeam,"Midfielder1","");
                    }else if(i===7){
                        team.setPosition(gamerTeam,"Midfielder2","");
                    }else if(i===8){
                        team.setPosition(gamerTeam,"Midfielder3","");
                    }else if(i===9){
                        team.setPosition(gamerTeam,"Attacker1","");
                    }else if(i===10){
                        team.setPosition(gamerTeam,"Attacker2","");
                    }
                }
            }
            teamTactics[tacticsPos]=currentPlayer;
            if(tacticsPos===0){
                team.setPosition(gamerTeam,"Goalkeeper",currentPlayer);
            }else if(tacticsPos===1){
                team.setPosition(gamerTeam,"Defender1",currentPlayer);
            }else if(tacticsPos===2){
                team.setPosition(gamerTeam,"Defender2",currentPlayer);
            }else if(tacticsPos===3){
                team.setPosition(gamerTeam,"Defender3",currentPlayer);
            }else if(tacticsPos===4){
                team.setPosition(gamerTeam,"Defender4",currentPlayer);
            }else if(tacticsPos===5){
                team.setPosition(gamerTeam,"Defender5",currentPlayer);
            }else if(tacticsPos===6){
                team.setPosition(gamerTeam,"Midfielder1",currentPlayer);
            }else if(tacticsPos===7){
                team.setPosition(gamerTeam,"Midfielder2",currentPlayer);
            }else if(tacticsPos===8){
                team.setPosition(gamerTeam,"Midfielder3",currentPlayer);
            }else if(tacticsPos===9){
                team.setPosition(gamerTeam,"Attacker1",currentPlayer);
            }else if(tacticsPos===10){
                team.setPosition(gamerTeam,"Attacker2",currentPlayer);
            }

            showShirts();
        }

        function showShirts(){
            if(teamTactics[0]!==""){
                goalkeeperShirt.shirt=homeShirt;
                goalkeeperShirt.text=player.getShortNameByUid(teamTactics[0]);
            }else{
                goalkeeperShirt.shirt="shirts/ShirtNonchoosen.png";
                goalkeeperShirt.text="";
            }

            if(teamTactics[1]!==""){
                liberoShirt.shirt=homeShirt;
                liberoShirt.text=player.getShortNameByUid(teamTactics[1]);
            }else {
                liberoShirt.shirt="shirts/ShirtNonchoosen.png";
                liberoShirt.text="";
            }
            if(teamTactics[2]!==""){
                leftdefendShirt.shirt=homeShirt;
                leftdefendShirt.text=player.getShortNameByUid(teamTactics[2]);
            }else{
                leftdefendShirt.shirt="shirts/ShirtNonchoosen.png";
                leftdefendShirt.text="";
            }
            if(teamTactics[3]!==""){
                rightdefendShirt.shirt=homeShirt;
                rightdefendShirt.text=player.getShortNameByUid(teamTactics[3]);
            }else{
                rightdefendShirt.shirt="shirts/ShirtNonchoosen.png";
                rightdefendShirt.text="";
            }
            if(teamTactics[4]!==""){
                lefthalfShirt.shirt=homeShirt;
                lefthalfShirt.text=player.getShortNameByUid(teamTactics[4]);
            }else{
                lefthalfShirt.shirt="shirts/ShirtNonchoosen.png";
                lefthalfShirt.text="";
            }
            if(teamTactics[5]!==""){
                righthalfShirt.shirt=homeShirt;
                righthalfShirt.text=player.getShortNameByUid(teamTactics[5]);
            }else{
                righthalfShirt.shirt="shirts/ShirtNonchoosen.png";
                righthalfShirt.text="";
            }
            if(teamTactics[6]!==""){
                midShirt.shirt=homeShirt;
                midShirt.text=player.getShortNameByUid(teamTactics[6]);
            }else {
                midShirt.shirt="shirts/ShirtNonchoosen.png";
                midShirt.text="";
            }
            if(teamTactics[7]!==""){
                leftmidShirt.shirt=homeShirt;
                leftmidShirt.text=player.getShortNameByUid(teamTactics[7]);
            }else{
                leftmidShirt.shirt="shirts/ShirtNonchoosen.png";
                leftmidShirt.text="";
            }
            if(teamTactics[8]!==""){
                rightmidShirt.shirt=homeShirt;
                rightmidShirt.text=player.getShortNameByUid(teamTactics[8]);
            }else{
                rightmidShirt.shirt="shirts/ShirtNonchoosen.png";
                rightmidShirt.text="";
            }
            if(teamTactics[9]!==""){
                leftattackShirt.shirt=homeShirt;
                leftattackShirt.text=player.getShortNameByUid(teamTactics[9]);
            }else{
                leftattackShirt.shirt="shirts/ShirtNonchoosen.png";
                leftattackShirt.text="";
            }
            if(teamTactics[10]!==""){
                rightattackShirt.shirt=homeShirt;
                rightattackShirt.text=player.getShortNameByUid(teamTactics[10]);
            }else{
                rightattackShirt.shirt="shirts/ShirtNonchoosen.png";
                rightattackShirt.text="";
            }

        }
        function getPlayers(){
            teamTactics[0]=team.getPosition(gamerTeam,"Goalkeeper");
            teamTactics[1]=team.getPosition(gamerTeam,"Defender1");
            teamTactics[2]=team.getPosition(gamerTeam,"Defender2");
            teamTactics[3]=team.getPosition(gamerTeam,"Defender3");
            teamTactics[4]=team.getPosition(gamerTeam,"Defender4");
            teamTactics[5]=team.getPosition(gamerTeam,"Defender5");
            teamTactics[6]=team.getPosition(gamerTeam,"Midfielder1");
            teamTactics[7]=team.getPosition(gamerTeam,"Midfielder2");
            teamTactics[8]=team.getPosition(gamerTeam,"Midfielder3");
            teamTactics[9]=team.getPosition(gamerTeam,"Attacker1");
            teamTactics[10]=team.getPosition(gamerTeam,"Attacker2");
        }


}
