import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {

    id:mainGamePlayedMatches
    z:20
    anchors.fill: parent

    property var matchList
    property int i
    property int j
    property string tempText
    property string date
    property string prevdate
    property string homeTeam
    property string awayTeam
    property string homeTeamName
    property string awayTeamName
    property int homeScore
    property int awayScore

    ListModel {
        id: resultModel
    }

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
            TableView {
                width: 620
                height: 620
                TableViewColumn {
                    role: "dateShow"
                    title: "Datum"
                    width: 100
                }
                TableViewColumn {
                    role: "hometeam"
                    title: "Hemmalag"
                    width: 200
                }
                TableViewColumn {
                    role: "separator"
                    title: ""
                    width: 20
                }
                TableViewColumn {
                    role: "awayteam"
                    title: "Bortalaglag"
                    width: 200
                }
                TableViewColumn {
                    role: "result"
                    title: "Resultat"
                    width: 100
                }
                model: resultModel
            }
        }
    }


    function show() {
        matchList=serie.getMatchesByUid("USADivision1");
        //console.log(gamerTeam);
        tempText="";
        prevdate="";
        resultModel.clear();
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
                tempText="<b>"+date+"</b>";
                resultModel.set(i,{dateShow: tempText});
                prevdate=date;
            }
            if(gamerTeam===homeTeam){
                tempText="<b>"+homeTeamName+"</b>";
            }else{
                tempText=homeTeamName;
            }
            resultModel.set(i,{hometeam: tempText});
            resultModel.set(i,{separator: "-"});
            tempText+=" - ";
            if(gamerTeam===awayTeam){
                tempText="<b>"+awayTeamName+"</b>";
            }else{
                tempText=awayTeamName;
            }
            resultModel.set(i,{awayteam: tempText});
            //console.log(homeScore);
            resultModel.set(i,{result: "-"});
            if(homeScore>0){
                //console.log("Debug");
                tempText=homeScore+"-"+awayScore;
                resultModel.set(i,{result: tempText});
            }
            tempText+="<br/>";
        }
        mainGamePlayedMatches.visible = true;
    }
    function hide() {
        mainGamePlayedMatches.visible = false;
    }

}
