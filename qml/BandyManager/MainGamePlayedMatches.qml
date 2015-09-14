import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {

    id:mainGamePlayedMatches
    z:20
    anchors.fill: parent

    property var matchList
    property var series
    property var seriesList
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
    ListModel {
        id: seriesModel
    }
    MainGameTableSeriesView {
        id: seriesColumn
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
    }

    Column {
        id: matchesColumn
        anchors.left: seriesColumn.right
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
        Text {
            id: matchListHeadline
            text: "Division 1"
            font.bold: true
            font.pointSize: 16
        }
        TableView {
            id: matchListView
            width: 620
            height: 620

            TableViewColumn {
                id: dateColumn
                role: "dateShow"
                title: "Datum"
                width: 100
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: hometeamColumn
                role: "hometeam"
                title: "Hemmalag"
                width: 200
                movable: false
                resizable: false
            }
            TableViewColumn {
                role: "separator"
                title: ""
                width: 20
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: awayteamColumn
                role: "awayteam"
                title: "Bortalaglag"
                width: 200
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: resultColumn
                role: "result"
                title: "Resultat"
                width: 100
                movable: false
                resizable: false
            }
            model: resultModel
            onClicked: {
//                console.log(matchListView.currentRow) ;
            }
        }
    }

    function show() {
        series="SwedenElitserien";
        getSeries();
        getSeriesDetail();
        mainGamePlayedMatches.visible = true;
    }
    function hide() {
        mainGamePlayedMatches.visible = false;
    }
    function getSeriesDetail() {
        matchList=serie.getMatchesByUid(series);
        matchListHeadline.text=serie.getNameByUid(series);
        tempText="";
        prevdate="";
        resultModel.clear();
        for(i=0;i<matchList.length;i++){
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
            resultModel.set(i,{result: "-"});
            if(homeScore>=0){
                tempText=homeScore+"-"+awayScore;
                resultModel.set(i,{result: tempText});
            }
            tempText+="<br/>";
        }
    }
    function getSeries() {
        seriesList=serie.getAllUid();
        seriesModel.clear();
        for(i=0; i < seriesList.length ; i++){
            seriesModel.set(i,{serieNameShow: serie.getNameByUid(seriesList[i])})
            seriesModel.set(i,{country: country.getNameByUid(serie.getCountryByUid(seriesList[i])) })
        }
    }
}
