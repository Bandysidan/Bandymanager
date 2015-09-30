import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager

import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0


Rectangle {

    id:mainGameHome
    z: 10
    anchors.fill: parent
    property string nextMatchID
    property string nextMatchHomeTeam
    property string nextMatchAwayTeam
    property string nextMatchDate
            Rectangle {
                id: newsContainer
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 10 // Sets all margins at once
                width: 450
                height: 200
                color: "red"
                border.color: "black"
                border.width: 2
                radius: 8
                Item{
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10 // Sets all margins at once
                    Column {
                        Text{
                            id: dateID
                            text: ""
                            font.bold: true
                        }
                        Text{
                            id: news
                            text: ""
                        }
                    }
                }
            }
            Rectangle {
                id: nextMatchContainer
                width: 450
                height: 200
                color: "green"
                border.color: "black"
                border.width: 2
                radius: 8
                anchors.left: parent.left
                anchors.top: newsContainer.bottom
                anchors.margins: 10 // Sets all margins at once
                Item{
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10 // Sets all margins at once
                    Column {
                        Text{
                            id: nextMatchHeader
                            text: "Nästa match"
                            font.bold: true
                            font.pointSize: 15
                        }
                        Text{
                            id: nextMatchDateText
                            text: ""
                            font.bold: true
                        }
                        Text{
                            id: nextMatchText
                            text: ""
                        }
                    }
                }
            }




    property var dateString

    Component.onCompleted: {

    }

    function show() {
        mainGameHome.visible = true;
        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        update();
        nextMatchID=match.getNextMatchByTeamUid(gamerTeam);
        if(nextMatchID=="err"){
            nextMatchDateText.text="";
            nextMatchText.text="Ingen match de närmaste 3 veckorna."
        }else{
            nextMatchDate=match.getMatchDay(nextMatchID);
            nextMatchHomeTeam=team.getNameByUid(match.getHomeTeamUid(nextMatchID));
            nextMatchAwayTeam=team.getNameByUid(match.getAwayTeamUid(nextMatchID));
            nextMatchDateText.text=nextMatchDate;
            nextMatchText.text=nextMatchHomeTeam+" - "+nextMatchAwayTeam;
        }
    }

    function update(){
        dateString=mainGame.getShortDate();
        dateID.text=dateString;
        if(dateString==="2015-09-10"){
            news.text=gamerName.concat(" är ny tränare för ",team.getNameByUid(gamerTeam),".");
        }else{
            news.text="";
        }

    }

    function hide() {
        mainGameHome.visible = false;
    }
}


