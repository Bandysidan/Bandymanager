import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: matchPlay
    z:25
    anchors.fill: parent

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
    property string matchUid: "SweElitR01M01"

    Text {
        text: "Spela matchen"
    }
    Text {
        id: homeTeamText
        x: 140
        y: 25
        text: homeTeamName
        font.pointSize: 50
    }
    Text {
        id: homeTeamScoreText
        x: 740
        y: 90
        text: homeTeamScore
        font.pointSize: 50
    }
    Text {
        id: scoreDash
        x:850
        y: 90
        text: "-"
        font.pointSize: 50
    }

    Text {
        id: awayTeamText
        x: 940
        y: 25
        text: awayTeamName
        font.pointSize: 50
    }
    Text {
        id: awayTeamScoreText
        x: 940
        y: 90
        text: awayTeamScore
        font.pointSize: 50
    }
    Text {
        id: eventText
        x: 140
        y: 150
        text: ""
    }

    Item {
        Timer {
            id: matchClock
            interval: 5; running: false; repeat: false
            onTriggered: {
                matchTick();
            }
        }
        Row{
            x: 200
            Text { id: mins}
            Text { id: colon ;text: ":"}
            Text { id: secs}

        }

    }
    function show() {
        matchPlay.visible = true;
        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        homeTeam=match.getHomeTeamUid(matchUid);
        awayTeam=match.getAwayTeamUid(matchUid);
        homeTeamName= team.getNameByUid(homeTeam);
        awayTeamName= team.getNameByUid(awayTeam);
        match.matchInitiate(matchUid);
        homeTeamScore= 0;
        awayTeamScore= 0;
        seconds= 0;
        minutes= 0;

    }

    function hide() {
        matchPlay.visible = false;
    }

    function startTime() {
        matchClock.running=true;
        matchClock.repeat=true;
    }

    function matchTick() {
        seconds++;
        if(seconds>59){
            seconds=0;
            minutes++;
        }
        if(minutes==45 && seconds==0) {
            matchClock.running=false;
            matchClock.repeat=false;
            eventText.text="Halvtid";
            secondHalfStart.show();
        }
        if(minutes==90 && seconds==0) {
            matchClock.running=false;
            matchClock.repeat=false;
            eventText.text="Slutsignal";
            matchEnd.show();
        }
        match.matchTick(matchUid,minutes,seconds);
        homeTeamScore=match.getHomeResult(matchUid);
        awayTeamScore=match.getAwayResult(matchUid);
        secs.text=seconds.toString();
        mins.text=minutes.toString();
    }
}
