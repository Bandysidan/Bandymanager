import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {

    id:mainGameTable
    z:20
    anchors.fill: parent

    property var matchList
    property var teamList
    property var placeList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var playedList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var wonList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var drawList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var lostList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var scoredList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var againstList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var pointList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property int i
    property int j
    property int tempPlac
    property string tempText
    property string homeTeam
    property string awayTeam
    property string homeTeamName
    property string awayTeamName
    property int homeScore
    property int awayScore

    ListModel {
        id: tableModel
    }

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
            TableView {
                id: matchListView
                width: 620
                height: 620

                TableViewColumn {
                    id: teamColumn
                    role: "teamname"
                    title: "Lag"
                    width: 200
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: playedColumn
                    role: "played"
                    title: "S"
                    width: 30
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: wonColumn
                    role: "won"
                    title: "V"
                    width: 30
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: drawColumn
                    role: "draw"
                    title: "O"
                    width: 30
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: lostColumn
                    role: "lost"
                    title: "F"
                    width: 30
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: scoredColumn
                    role: "scored"
                    title: "GM"
                    width: 50
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: separatorColumn
                    role: "separator"
                    width: 20
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: againstColumn
                    role: "against"
                    title: "IM"
                    width: 50
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    id: pointColumn
                    role: "point"
                    title: "P"
                    width: 50
                    movable: false
                    resizable: false
                }


                model: tableModel
                onClicked: {
                    console.log(matchListView.currentRow) ;
                }
            }
        }

    }


    function show() {
        mainGameTable.visible = true;
        teamList=serie.getTeamsByUid("USADivision1");
        matchList=serie.getMatchesByUid("USADivision1");
        //console.log(matchList);
        tempText="";
        for(i=0;i<teamList.length;i++) {
            placeList[i]=i;
            playedList[i]=0;
            wonList[i]=0;
            drawList[i]=0;
            lostList[i]=0;
            scoredList[i]=0;
            againstList[i]=0;
            pointList[i]=0;
            for(j=0;j<matchList.length;j++){
                homeTeam=match.getHomeTeamUid(matchList[j]);
                awayTeam=match.getAwayTeamUid(matchList[j]);
                homeScore=match.getHomeResult(matchList[j]);
                awayScore=match.getAwayResult(matchList[j]);
                if(homeTeam===teamList[i] && homeScore>=0){
                    playedList[i]++;
                    scoredList[i]+=homeScore;
                    againstList[i]+=awayScore;
                    if(homeScore>awayScore){
                        wonList[i]++;
                        pointList[i]+=2;
                    }else if(homeScore<awayScore){
                        lostList[i]++;
                    }else{
                        drawList[i]++;
                        pointList[i]++;
                    }
                }else if(awayTeam===teamList[i] && homeScore>=0){
                    playedList[i]++;
                    scoredList[i]+=homeScore;
                    againstList[i]+=awayScore;
                    if(homeScore>awayScore){
                        wonList[i]++;
                        pointList[i]+=2;
                    }else if(homeScore<awayScore){
                        lostList[i]++;
                    }else{
                        drawList[i]++;
                        pointList[i]++;
                    }
                }
            }
        }
        for(i=0;i<teamList.length-1;i++) {
            for(j=i+1;j<teamList.length;j++) {
                if(pointList[placeList[j]]>pointList[placeList[i]]){
                    tempPlac=placeList[j];
                    placeList[j]=placeList[i];
                    placeList[i]=tempPlac;
                }
            }
        }

        for(i=0;i<teamList.length;i++) {
            if(teamList[i]===gamerTeam) {
                tempText="<b>"+teamList[placeList[i]]+"</b>";
            }else{
                tempText=teamList[placeList[i]];
            }
            console.log(i);
            console.log(placeList[i]);
            console.log(teamList[placeList[i]]);
            console.log(wonList[i]);
            tableModel.set(i,{teamname: tempText});
            tableModel.set(i,{played: playedList[placeList[i]]});
            tableModel.set(i,{won: wonList[placeList[i]]});
            tableModel.set(i,{draw: drawList[placeList[i]]});
            tableModel.set(i,{lost: lostList[placeList[i]]});
            tableModel.set(i,{scored: scoredList[placeList[i]]});
            tableModel.set(i,{separator: "-"});
            tableModel.set(i,{against: againstList[placeList[i]]});
            tableModel.set(i,{point: pointList[placeList[i]]});

        }
    }
    function hide() {
        mainGameTable.visible = false;
    }
}
