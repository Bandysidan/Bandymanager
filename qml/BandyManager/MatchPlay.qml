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

    property string homeTeam
    property string awayTeam
    property string homeTeamName
    property string awayTeamName
    property int homeTeamScore
    property int awayTeamScore
    property int seconds
    property int minutes
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
        homeTeam= "SAIKbandyherrar";
        awayTeam= "Edsbynherrar";
        homeTeamName= team.getNameByUid(homeTeam);
        awayTeamName= team.getNameByUid(awayTeam);
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
        if(minutes==4 && seconds==24) {
            awayTeamScore++;
            eventText.text="Edsbyn gjorde 0-1";
        }
        if(minutes==9 && seconds==33) {
            awayTeamScore++;
            eventText.text="Edsbyn gjorde 0-2";
        }
        if(minutes==14 && seconds==12) {
            homeTeamScore++;
            eventText.text="Sandviken gjorde 1-2";
        }
        if(minutes==35 && seconds==4) {
            awayTeamScore++;
            eventText.text="Edsbyn gjorde 1-3";
        }
        if(minutes==47 && seconds==56) homeTeamScore++;
        if(minutes==74 && seconds==24) awayTeamScore++;
        if(minutes==87 && seconds==24) homeTeamScore++;
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

        secs.text=seconds.toString();
        mins.text=minutes.toString();
    }
}
