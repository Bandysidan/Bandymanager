import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {

    id:mainGameTable
    z:20
    anchors.fill: parent

    property var matchList
    property var teamList
    property var playedList: [10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var wonList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var drawList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var lostList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var scoredList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property var againstList: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    property int i
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
        for(i=0;i<matchList.length;i++){

            homeTeam=match.getHomeTeamUid(matchList[i]);
            awayTeam=match.getAwayTeamUid(matchList[i]);
            homeScore=match.getHomeResult(matchList[i]);
            awayScore=match.getAwayResult(matchList[i]);
        }
        for(i=0;i<teamList.length;i++) {
            tableModel.set(i,{teamname: teamList[i]});
            tableModel.set(i,{played: playedList[i]});
            tableModel.set(i,{won: wonList[i]});
            tableModel.set(i,{draw: drawList[i]});
            tableModel.set(i,{lost: lostList[i]});

        }
    }
    function hide() {
        mainGameTable.visible = false;
    }
}
