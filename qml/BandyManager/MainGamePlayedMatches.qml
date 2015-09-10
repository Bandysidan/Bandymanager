import QtQuick 2.0

Rectangle {

    id:mainGamePlayedMatches
    z:20
    anchors.fill: parent

    property var matchList
    property int i
    property string tempText
    property string date
    property string prevdate
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
                id: matchListHeadline
                text: "Division 1"
                font.bold: true
                font.pointSize: 16
            }
            Text {
                id: matchListText
                text: ""
            }
        }
    }


    function show() {
        matchList=serie.getMatchesByUid("USADivision1");
        //console.log(gamerTeam);
        tempText="";
        prevdate="";
        for(i=0;i<matchList.length;i++){
            //console.log(matchList[i]);
            date=match.getMatchDay(matchList[i]);
            homeTeam=match.getHomeTeamUid(matchList[i]);
            awayTeam=match.getAwayTeamUid(matchList[i]);
            homeTeamName=team.getNameByUid(homeTeam);
            awayTeamName=team.getNameByUid(awayTeam);
            homeScore=match.getHomeResult(matchList[i]);
            awayScore=match.getAwayResult(matchList[i]);
            if(date != prevdate){
                tempText+="<br/><b>"+date+"</b><br/>";
                prevdate=date;
            }
            if(gamerTeam===homeTeam){
                tempText+="<b>"+homeTeamName+"</b>";
            }else{
                tempText+=homeTeamName;
            }
            tempText+=" - ";
            if(gamerTeam===awayTeam){
                tempText+="<b>"+awayTeamName+"</b>";
            }else{
                tempText+=awayTeamName;
            }
            if(homeScore>0){

                tempText+="     <b>"+homeScore+"-"+awayScore+"</b>";
            }
            tempText+="<br/>";
        }
        matchListText.text=tempText;
        mainGamePlayedMatches.visible = true;
    }
    function hide() {
        mainGamePlayedMatches.visible = false;
    }

}
