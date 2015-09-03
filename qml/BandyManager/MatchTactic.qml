import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: matchTactic
    z: 25
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

    Text {
        text: "Taktiksida"
    }
    Text {
        x: 140
        y: 25
        text: team.getNameByUid(homeTeam)
    }
    Text {
        x: 940
        y: 25
        text: team.getNameByUid(awayTeam)
    }

    Image {
        id: pitchHome
        x: 140
        y: 40
        height: 800
        width: 530
        source: "pitch.png"
    }

    BandyManager.MatchShirt {
        id: homegoalkeeperShirt
        pos: 0
        x: 375
        y: 725
    }

    BandyManager.MatchShirt {
        id: homeliberoShirt
        pos: 1
        x: 375
        y: 625
    }

    BandyManager.MatchShirt {
        id: homeleftdefendShirt
        pos: 2
        x: 275
        y: 595
    }

    BandyManager.MatchShirt {
        id: homerightdefendShirt
        pos: 3
        x: 475
        y: 595
    }

    BandyManager.MatchShirt {
        id: homelefthalfShirt
        pos: 4
        x: 175
        y: 575
    }

    BandyManager.MatchShirt {
        id: homerighthalfShirt
        pos: 5
        x: 575
        y: 575
    }

    BandyManager.MatchShirt {
        id: homemidShirt
        pos: 6
        x: 375
        y: 445
    }

    BandyManager.MatchShirt {
        id: homeleftmidShirt
        pos: 7
        x: 195
        y: 405
    }
    BandyManager.MatchShirt {
        id: homerightmidShirt
        pos: 8
        x: 555
        y: 405
    }

    BandyManager.MatchShirt {
        id: homeleftattackShirt
        pos: 9
        x: 275
        y: 205
    }

    BandyManager.MatchShirt {
        id: homerightattackShirt
        pos: 10
        x: 455
        y: 205
    }

    Image {
        id: pitchAway
        x: 940
        y: 40
        height: 800
        width: 530
        source: "pitch.png"
    }

    BandyManager.MatchShirt {
        id: awaygoalkeeperShirt
        pos: 100
        x: 1175
        y: 725
    }

    BandyManager.MatchShirt {
        id: awayliberoShirt
        pos:101
        x: 1175
        y: 625
    }

    BandyManager.MatchShirt {
        id: awayleftdefendShirt
        pos:102
        x: 1075
        y: 595
    }

    BandyManager.MatchShirt {
        id: awayrightdefendShirt
        pos:103
        x: 1275
        y: 595
    }

    BandyManager.MatchShirt {
        id: awaylefthalfShirt
        pos:104
        x: 975
        y: 575
    }

    BandyManager.MatchShirt {
        id: awayrighthalfShirt
        pos:105
        x: 1375
        y: 575
    }

    BandyManager.MatchShirt {
        id: awaymidShirt
        pos: 106
        x: 1175
        y: 445
    }

    BandyManager.MatchShirt {
        id: awayleftmidShirt
        pos: 107
        x: 995
        y: 405
    }
    BandyManager.MatchShirt {
        id: awayrightmidShirt
        pos: 108
        x: 1355
        y: 405
    }

    BandyManager.MatchShirt {
        id: awayleftattackShirt
        pos: 109
        x: 1075
        y: 205
    }

    BandyManager.MatchShirt {
        id: awayrightattackShirt
        pos: 110
        x: 1275
        y: 205
    }

    function show() {


        gamerName=gamer.getName("Player1");
        gamerTeam=gamer.getTeamUid("Player1");
        matchUid=match.getUidByTeamUid(gamerTeam);
        console.log(matchUid);
        homeTeam=match.getHomeTeamUid(matchUid);
        homeShirt="shirts/"+team.getHomeShirtByUid(homeTeam);
        awayTeam=match.getAwayTeamUid(matchUid);
        awayShirt="shirts/"+team.getHomeShirtByUid(awayTeam);
        if(homeTeam===gamerTeam){
            team.autoPositions(awayTeam);
        }else{
            team.autoPositions(homeTeam);
        }

        matchTactic.visible = true;
        getPlayers();
        showShirts();
    }

    function hide() {
        matchTactic.visible = false;
    }

    function getPlayers(){
        homeTeamTactics[0]=team.getPosition(homeTeam,"Goalkeeper");
        homeTeamTactics[1]=team.getPosition(homeTeam,"Defender1");
        homeTeamTactics[2]=team.getPosition(homeTeam,"Defender2");
        homeTeamTactics[3]=team.getPosition(homeTeam,"Defender3");
        homeTeamTactics[4]=team.getPosition(homeTeam,"Defender4");
        homeTeamTactics[5]=team.getPosition(homeTeam,"Defender5");
        homeTeamTactics[6]=team.getPosition(homeTeam,"Midfielder1");
        homeTeamTactics[7]=team.getPosition(homeTeam,"Midfielder2");
        homeTeamTactics[8]=team.getPosition(homeTeam,"Midfielder3");
        homeTeamTactics[9]=team.getPosition(homeTeam,"Attacker1");
        homeTeamTactics[10]=team.getPosition(homeTeam,"Attacker2");
        awayTeamTactics[0]=team.getPosition(awayTeam,"Goalkeeper");
        awayTeamTactics[1]=team.getPosition(awayTeam,"Defender1");
        awayTeamTactics[2]=team.getPosition(awayTeam,"Defender2");
        awayTeamTactics[3]=team.getPosition(awayTeam,"Defender3");
        awayTeamTactics[4]=team.getPosition(awayTeam,"Defender4");
        awayTeamTactics[5]=team.getPosition(awayTeam,"Defender5");
        awayTeamTactics[6]=team.getPosition(awayTeam,"Midfielder1");
        awayTeamTactics[7]=team.getPosition(awayTeam,"Midfielder2");
        awayTeamTactics[8]=team.getPosition(awayTeam,"Midfielder3");
        awayTeamTactics[9]=team.getPosition(awayTeam,"Attacker1");
        awayTeamTactics[10]=team.getPosition(awayTeam,"Attacker2");
    }

    function showShirts(){
        if(homeTeamTactics[0]!==""){
            homegoalkeeperShirt.shirt=homeShirt;
            homegoalkeeperShirt.text=player.getShortNameByUid(homeTeamTactics[0]);
        }else{
            homegoalkeeperShirt.shirt="shirts/ShirtNonchoosen.png";
            homegoalkeeperShirt.text="";
        }

        if(homeTeamTactics[1]!==""){
            homeliberoShirt.shirt=homeShirt;
            homeliberoShirt.text=player.getShortNameByUid(homeTeamTactics[1]);
        }else {
            homeliberoShirt.shirt="shirts/ShirtNonchoosen.png";
            homeliberoShirt.text="";
        }
        if(homeTeamTactics[2]!==""){
            homeleftdefendShirt.shirt=homeShirt;
            homeleftdefendShirt.text=player.getShortNameByUid(homeTeamTactics[2]);
        }else{
            homeleftdefendShirt.shirt="shirts/ShirtNonchoosen.png";
            homeleftdefendShirt.text="";
        }
        if(homeTeamTactics[3]!==""){
            homerightdefendShirt.shirt=homeShirt;
            homerightdefendShirt.text=player.getShortNameByUid(homeTeamTactics[3]);
        }else{
            homerightdefendShirt.shirt="shirts/ShirtNonchoosen.png";
            homerightdefendShirt.text="";
        }
        if(homeTeamTactics[4]!==""){
            homelefthalfShirt.shirt=homeShirt;
            homelefthalfShirt.text=player.getShortNameByUid(homeTeamTactics[4]);
        }else{
            homelefthalfShirt.shirt="shirts/ShirtNonchoosen.png";
            homelefthalfShirt.text="";
        }
        if(homeTeamTactics[5]!==""){
            homerighthalfShirt.shirt=homeShirt;
            homerighthalfShirt.text=player.getShortNameByUid(homeTeamTactics[5]);
        }else{
            homerighthalfShirt.shirt="shirts/ShirtNonchoosen.png";
            homerighthalfShirt.text="";
        }
        if(homeTeamTactics[6]!==""){
            homemidShirt.shirt=homeShirt;
            homemidShirt.text=player.getShortNameByUid(homeTeamTactics[6]);
        }else {
            homemidShirt.shirt="shirts/ShirtNonchoosen.png";
            homemidShirt.text="";
        }
        if(homeTeamTactics[7]!==""){
            homeleftmidShirt.shirt=homeShirt;
            homeleftmidShirt.text=player.getShortNameByUid(homeTeamTactics[7]);
        }else{
            homeleftmidShirt.shirt="shirts/ShirtNonchoosen.png";
            homeleftmidShirt.text="";
        }
        if(homeTeamTactics[8]!==""){
            homerightmidShirt.shirt=homeShirt;
            homerightmidShirt.text=player.getShortNameByUid(homeTeamTactics[8]);
        }else{
            homerightmidShirt.shirt="shirts/ShirtNonchoosen.png";
            homerightmidShirt.text="";
        }
        if(homeTeamTactics[9]!==""){
            homeleftattackShirt.shirt=homeShirt;
            homeleftattackShirt.text=player.getShortNameByUid(homeTeamTactics[9]);
        }else{
            homeleftattackShirt.shirt="shirts/ShirtNonchoosen.png";
            homeleftattackShirt.text="";
        }
        if(homeTeamTactics[10]!==""){
            homerightattackShirt.shirt=homeShirt;
            homerightattackShirt.text=player.getShortNameByUid(homeTeamTactics[10]);
        }else{
            homerightattackShirt.shirt="shirts/ShirtNonchoosen.png";
            homerightattackShirt.text="";
        }

        if(awayTeamTactics[0]!==""){
            awaygoalkeeperShirt.shirt=awayShirt;
            awaygoalkeeperShirt.text=player.getShortNameByUid(awayTeamTactics[0]);
        }else{
            awaygoalkeeperShirt.shirt="shirts/ShirtNonchoosen.png";
            awaygoalkeeperShirt.text="";
        }
        if(awayTeamTactics[1]!==""){
            awayliberoShirt.shirt=awayShirt;
            awayliberoShirt.text=player.getShortNameByUid(awayTeamTactics[1]);
        }else {
            awayliberoShirt.shirt="shirts/ShirtNonchoosen.png";
            awayliberoShirt.text="";
        }
        if(awayTeamTactics[2]!==""){
            awayleftdefendShirt.shirt=awayShirt;
            awayleftdefendShirt.text=player.getShortNameByUid(awayTeamTactics[2]);
        }else{
            awayleftdefendShirt.shirt="shirts/ShirtNonchoosen.png";
            awayleftdefendShirt.text="";
        }
        if(awayTeamTactics[3]!==""){
            awayrightdefendShirt.shirt=awayShirt;
            awayrightdefendShirt.text=player.getShortNameByUid(awayTeamTactics[3]);
        }else{
            awayrightdefendShirt.shirt="shirts/ShirtNonchoosen.png";
            awayrightdefendShirt.text="";
        }
        if(awayTeamTactics[4]!==""){
            awaylefthalfShirt.shirt=awayShirt;
            awaylefthalfShirt.text=player.getShortNameByUid(awayTeamTactics[4]);
        }else{
            awaylefthalfShirt.shirt="shirts/ShirtNonchoosen.png";
            awaylefthalfShirt.text="";
        }
        if(awayTeamTactics[5]!==""){
            awayrighthalfShirt.shirt=awayShirt;
            awayrighthalfShirt.text=player.getShortNameByUid(awayTeamTactics[5]);
        }else{
            awayrighthalfShirt.shirt="shirts/ShirtNonchoosen.png";
            awayrighthalfShirt.text="";
        }
        if(awayTeamTactics[6]!==""){
            awaymidShirt.shirt=awayShirt;
            awaymidShirt.text=player.getShortNameByUid(awayTeamTactics[6]);
        }else {
            awaymidShirt.shirt="shirts/ShirtNonchoosen.png";
            awaymidShirt.text="";
        }
        if(awayTeamTactics[7]!==""){
            awayleftmidShirt.shirt=awayShirt;
            awayleftmidShirt.text=player.getShortNameByUid(awayTeamTactics[7]);
        }else{
            awayleftmidShirt.shirt="shirts/ShirtNonchoosen.png";
            awayleftmidShirt.text="";
        }
        if(awayTeamTactics[8]!==""){
            awayrightmidShirt.shirt=awayShirt;
            awayrightmidShirt.text=player.getShortNameByUid(awayTeamTactics[8]);
        }else{
            awayrightmidShirt.shirt="shirts/ShirtNonchoosen.png";
            awayrightmidShirt.text="";
        }
        if(awayTeamTactics[9]!==""){
            awayleftattackShirt.shirt=awayShirt;
            awayleftattackShirt.text=player.getShortNameByUid(awayTeamTactics[9]);
        }else{
            awayleftattackShirt.shirt="shirts/ShirtNonchoosen.png";
            awayleftattackShirt.text="";
        }
        if(awayTeamTactics[10]!==""){
            awayrightattackShirt.shirt=awayShirt;
            awayrightattackShirt.text=player.getShortNameByUid(awayTeamTactics[10]);
        }else{
            awayrightattackShirt.shirt="shirts/ShirtNonchoosen.png";
            awayrightattackShirt.text="";
        }

    }

}
