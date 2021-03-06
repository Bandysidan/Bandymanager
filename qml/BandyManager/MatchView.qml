import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0


Rectangle {
    id: matchView
    z:20

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
    Match {
        id: match
    }
    Game {
        id: game
    }

    property var gamerName
    property var gamerTeam
    property string homeTeam
    property string awayTeam
    property string homeTeamName
    property string awayTeamName
    property int homeTeamScore
    property int awayTeamScore
    property int seconds
    property int minutes
    property var homeTeamTactics: ["","","","","","","","","","","","","",""]
    property var awayTeamTactics: ["","","","","","","","","","","","","",""]
    property string matchUid
    property string homeShirt
    property string awayShirt
    property int days
    property var matchList
    property int i
    property var playedGames
    property int gamerToday
    property var events

    anchors.fill: parent
    Image {
        id: logo
        x: 110
        y: 10
        width: 235
        height: 142
        fillMode: Image.PreserveAspectFit
        source: "BMlogo.png"
    }

    Rectangle {
        x: 0
        y: 0
        width: 106
        height: 1000

        gradient: Gradient { // This sets a vertical gradient fill
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 1.0; color: "darkgrey" }
        }
        Column {
            width: 100
            height: 990
            anchors.centerIn: parent
            spacing: 3

            BandyManager.MainGameButton {
                id: matchStart
                text: "Starta matchen"
                onClicked: {
                    matchTactic.hide();
                    matchPlay.show();
                    matchStart.hide();
                    matchPlay.startTime();
                }
            }
            BandyManager.MainGameButton {
                id: secondHalfStart
                text: "2:a halvlek"
                visible: false
                onClicked: {
                    secondHalfStart.hide();
                    matchPlay.startTime();
                }
            }
            BandyManager.MainGameButton {
                id: matchEnd
                text: "Avsluta matchen"
                visible: false
                onClicked: {
                    matchStart.show();
                    secondHalfStart.hide();
                    matchEnd.hide();
                    matchPlay.hide();
                    matchView.hide();

                }
            }

        }
    }
    Rectangle {
       x: 108
       y: 154
       width:1000
       height: 900
       BandyManager.MatchTactic {
           id: matchTactic
           visible: false
       }
       BandyManager.MatchPlay {
           id: matchPlay
           visible: false
       }
    }


    function show() {
        matchView.visible = true;
        matchTactic.hide();
        matchPlay.hide();
        matchStart.hide();

        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        gamerToday=0;
        days=0;
        matchUid="";
        while (gamerToday==0 && days < 7){
            matchList = match.getMatchesForDaysAhead(days);
            homeTeam="";
            awayTeam="";
            for(i=0;i<matchList.length;i++){
                homeTeam=match.getHomeTeamUid(matchList[i]);
                awayTeam=match.getAwayTeamUid(matchList[i]);
                if(homeTeam===gamerTeam || awayTeam===gamerTeam){
                    gamerToday=1
                    matchUid=matchList[i];
                    homeShirt="shirts/"+team.getHomeShirtByUid(homeTeam);
                    awayShirt="shirts/"+team.getHomeShirtByUid(awayTeam);
                    if(homeTeam===gamerTeam){
                        team.autoPositions(awayTeam);
                    }else{
                        team.autoPositions(homeTeam);
                    }
                }else{
                    team.autoPositions(awayTeam);
                    team.autoPositions(homeTeam);
                    match.matchInitiate(matchList[i]);
                    seconds = 0;
                    minutes = 0;
                    homeTeamScore=0;
                    awayTeamScore=0;
                    for(minutes=0;minutes<=90;minutes++){
                        for(seconds=0;seconds<60;seconds++){
                            match.matchTick(matchList[i],minutes,seconds);
                        }
                    }
                    homeTeamScore=match.getHomeResult(matchList[i]);
                    awayTeamScore=match.getAwayResult(matchList[i]);
                }
            }
            days++;
        }
        game.addDays(days);
        if(gamerToday==1){
            homeTeam=match.getHomeTeamUid(matchUid);
            awayTeam=match.getAwayTeamUid(matchUid);
            matchTactic.show();
            matchStart.show();
        }else{
            matchView.visible = false;
        }
    }

    function hide() {
        matchView.visible = false;
    }
}
