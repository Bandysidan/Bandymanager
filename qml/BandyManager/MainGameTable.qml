import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {

    id:mainGameTable
    z:20
    anchors.fill: parent

    property var playerList
    property var matchList
    property var teamList
    property var series
    property var seriesList
    property var currentTeam
    property string playerNumber:"1"
    property var playerSkills
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
    ListModel {
        id: seriesModel
    }
    ListModel {
        id: playerModel
    }

    MainGameTableSeriesView {
        id: seriesColumn
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
    }

    Column {
        id: tableColumn
        anchors.left: seriesColumn.right
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once

        Text {
            id: tableHeadline
            text: "Division 1"
            font.bold: true
            font.pointSize: 16
        }
        TableView {
            id: matchListView
            width: 495
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
                changeTeam(matchListView.currentRow);
            }
        }
    }

    Column {
        id: teamPlayerColumn
        anchors.left: tableColumn.right
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once

        Text {
            id: teamPlayerHeadline
            text: " "
            font.bold: true
            font.pointSize: 16
        }
        TableView {
            id: playerListView
            width: 495
            height: 620

            TableViewColumn {
                id: playerNameColumn
                role: "playername"
                title: "Namn"
                width: 200
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: goalkeeperColumn
                role: "goalkeeperSkill"
                title: "MV"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: liberoColumn
                role: "liberoSkill"
                title: "LI"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: defenderColumn
                role: "defenderSkill"
                title: "B"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: halfColumn
                role: "halfSkill"
                title: "H"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: midfieldColumn
                role: "midfieldSkill"
                title: "MF"
                width: 50
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: attackColumn
                role: "attackSkill"
                title: "AN"
                width: 50
                movable: false
                resizable: false
            }


            model: playerModel
        }
    }

    function show() {
        mainGameTable.visible = true;
        series="SwedenElitserien";
        getSeries();
        getSeriesDetail();
    }
    function hide() {
        mainGameTable.visible = false;
    }
    function getSeriesDetail() {
        teamList=serie.getTeamsByUid(series);
        matchList=serie.getMatchesByUid(series);
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
                    scoredList[i]+=awayScore;
                    againstList[i]+=homeScore;
                    if(awayScore>homeScore){
                        wonList[i]++;
                        pointList[i]+=2;
                    }else if(awayScore<homeScore){
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
        tableModel.clear();
        for(i=0;i<teamList.length;i++) {
            if(teamList[placeList[i]]===gamerTeam) {
                tempText="<b>"+team.getNameByUid(teamList[placeList[i]])+"</b>";
            }else{
                tempText=team.getNameByUid(teamList[placeList[i]]);
            }
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
    function getSeries() {
        seriesList=serie.getAllUid();
        seriesModel.clear();
        for(i=0; i < seriesList.length ; i++){
            seriesModel.set(i,{serieNameShow: serie.getNameByUid(seriesList[i])})
            seriesModel.set(i,{country: country.getNameByUid(serie.getCountryByUid(seriesList[i]))})
        }
    }
    function changeTeam(teamindex){
        playerModel.clear();
        currentTeam = teamList[teamindex];
        teamPlayerHeadline.text=team.getNameByUid(teamList[teamindex]);
        playerList=player.getPlayerUidsbyTeam(currentTeam);
        for(i=0;i < playerList.length ; i++){
            playerSkills = player.getPositionSkills(playerList[i]);
            playerNumber=i.toString();
            playerModel.set(i,{playername: player.getFullNameByUid(playerList[i])});
            playerModel.set(i,{goalkeeperSkill: parseInt((playerSkills[0]-1)/10+1)});
            playerModel.set(i,{liberoSkill: parseInt((playerSkills[1]-1)/10+1)});
            playerModel.set(i,{defenderSkill: parseInt((playerSkills[2]-1)/10+1)});
            playerModel.set(i,{halfSkill: parseInt((playerSkills[3]-1)/10+1)});
            playerModel.set(i,{midfieldSkill: parseInt((playerSkills[4]-1)/10+1)});
            playerModel.set(i,{attackSkill: parseInt((playerSkills[5]-1)/10+1)});
        }
    }
}
