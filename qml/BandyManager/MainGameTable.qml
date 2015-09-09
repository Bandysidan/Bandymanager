import QtQuick 2.0

Rectangle {

    id:mainGameTable
    z:20
    anchors.fill: parent

    property var matchList
    property int i
    property string tempText
    property string homeTeam
    property string awayTeam
    property string homeTeamName
    property string awayTeamName
    property int homeScore
    property int awayScore

    Item{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
        Column {
            Text {
                id: tableHeadline
                text: "Division 1"
                font.bold: true
                font.pointSize: 16
            }
            Text {
                id: tableText
                text: "Test"
            }
        }

    }


    function show() {
        mainGameTable.visible = true;
        matchList=serie.getMatchesByUid("USADivision1");
        //console.log(matchList);
        tempText="";
        for(i=0;i<matchList.length;i++){
            console.log(matchList[i]);
            homeTeam=match.getHomeTeamUid(matchList[i]);
            awayTeam=match.getAwayTeamUid(matchList[i]);
            homeScore=match.getHomeResult(matchList[i]);
            awayScore=match.getAwayResult(matchList[i]);
        }
        tableText.text="Tabellen";
    }
    function hide() {
        mainGameTable.visible = false;
    }
}
