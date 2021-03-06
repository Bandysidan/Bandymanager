import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: matchPlay
    z:25
    anchors.fill: parent

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
        //events=match.getMatchEvents(matchUid);
        match.matchTick(matchUid,minutes,seconds);
        homeTeamScore=match.getHomeResult(matchUid);
        awayTeamScore=match.getAwayResult(matchUid);
        secs.text=seconds.toString();
        mins.text=minutes.toString();
        if(minutes==45 && seconds==0) {
            matchClock.running=false;
            matchClock.repeat=false;
            secondHalfStart.show();
        }
        if(minutes==90 && seconds==0) {
            matchClock.running=false;
            matchClock.repeat=false;
            matchEnd.show();
        }
        eventText.text=match.getMatchEvent(matchUid);
    }
}
