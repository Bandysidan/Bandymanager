#include "match.h"

QHash<QString,Match *> *Match::m_matches;
QHash<QString,QString> *Match::m_home_team;
QHash<QString,QString> *Match::m_away_team;
QMultiHash<QDate,QString>   *Match::m_match_dates;

Match::Match(QObject *parent) :
    QObject(parent)
{
    if(!m_matches)
        m_matches= new QHash<QString,Match *>();
    if(!m_home_team)
        m_home_team = new QHash<QString,QString>();
    if(!m_away_team)
        m_away_team = new QHash<QString,QString>();
    if(!m_match_dates)
        m_match_dates=new QMultiHash<QDate,QString>();
}

void Match::setUid(QString value)
{
    m_uid = value;
    m_matches->insert(m_uid,this);
    m_home_team->insert(m_home_team_uid,m_uid);
    m_away_team->insert(m_away_team_uid,m_uid);
    m_match_dates->insert(QDate(m_match_year,m_match_month,m_match_day),m_uid);
    emit uidChanged();
}

QString Match::uid()
{
    return m_uid;
}

void Match::setHomeTeamUid(QString value)
{
    m_home_team_uid = value;
    emit homeTeamUidChanged();

}

QString Match::homeTeamUid()
{
    return m_home_team_uid;
}

void Match::setAwayTeamUid(QString value)
{
    m_away_team_uid = value;
    emit awayTeamUidChanged();
}

QString Match::awayTeamUid()
{
    return m_away_team_uid;
}

void Match::setMatchDay(int value)
{
    m_match_day=value;
    emit matchDayChanged();
}

int Match::matchDay()
{
    return m_match_day;
}

void Match::setMatchMonth(int value)
{
    m_match_month=value;
    emit matchMonthChanged();
}

int Match::matchMonth()
{
    return m_match_month;
}

void Match::setMatchYear(int value)
{
    m_match_year=value;
    emit matchYearChanged();
}

int Match::matchYear()
{
    return m_match_year;
}

void Match::setHomeTeamScore(int value)
{
    m_home_score=value;
    emit homeTeamScore();
}

int Match::homeTeamScore()
{
    return m_home_score;
}

void Match::setAwayTeamScore(int value)
{
    m_away_score=value;
    emit awayTeamScore();
}

int Match::awayTeamScore()
{
    return m_away_score;
}

QString Match::getHomeTeamUid(QString value)
{
    Match *match =m_matches->value(value);
    if(match){
        return match->homeTeamUid();
    }else{
        return "error";
    }
}

QString Match::getAwayTeamUid(QString value)
{
    Match *match =m_matches->value(value);
    if(match){
        //qDebug() << "Away team"<< match->awayTeamUid();
        return match->awayTeamUid();
    }else{
        return "error";
    }

}

QString Match::getUidByTeamUid(QString value)
{
    QString match = m_home_team->value(value);
    if(match==""){
        match = m_away_team->value(value);
    }
    if(match!=""){
        return match;
    }else{
        return "error";
    }

}

QList<QString> Match::getMatchesForDaysAhead(int days)
{
    QList<QString> returnMatches;
    Game *game;
    QDate todayDate=game->getDate();
    QDate indaysDate=todayDate.addDays(days);
    qDebug() << indaysDate;
    returnMatches=m_match_dates->values(indaysDate);
    return returnMatches;
}

void Match::matchInitiate(QString value)
{
    Match *match = m_matches->value(value);
    Team *team;
    Player *player;
    QList<int> possitionSkills;

    if(match){

       match->m_home_player_positions.insert("Goalkeeper",team->getPosition(match->homeTeamUid(),"Goalkeeper"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Goalkeeper"));
       match->m_home_player_skill.insert("Goalkeeper",possitionSkills[0]);
       match->m_home_player_positions.insert("Defender1",team->getPosition(match->homeTeamUid(),"Defender1"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Defender1"));
       match->m_home_player_skill.insert("Defender1",possitionSkills[1]);
       match->m_home_player_positions.insert("Defender2",team->getPosition(match->homeTeamUid(),"Defender2"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Defender2"));
       match->m_home_player_skill.insert("Defender2",possitionSkills[2]);
       match->m_home_player_positions.insert("Defender3",team->getPosition(match->homeTeamUid(),"Defender3"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Defender3"));
       match->m_home_player_skill.insert("Defender3",possitionSkills[2]);
       match->m_home_player_positions.insert("Defender4",team->getPosition(match->homeTeamUid(),"Defender4"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Defender4"));
       match->m_home_player_skill.insert("Defender4",possitionSkills[3]);
       match->m_home_player_positions.insert("Defender5",team->getPosition(match->homeTeamUid(),"Defender5"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Defender5"));
       match->m_home_player_skill.insert("Defender5",possitionSkills[3]);
       match->m_home_player_positions.insert("Midfielder1",team->getPosition(match->homeTeamUid(),"Midfielder1"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Midfielder1"));
       match->m_home_player_skill.insert("Midfielder1",possitionSkills[4]);
       match->m_home_player_positions.insert("Midfielder2",team->getPosition(match->homeTeamUid(),"Midfielder2"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Midfielder2"));
       match->m_home_player_skill.insert("Midfielder2",possitionSkills[4]);
       match->m_home_player_positions.insert("Midfielder3",team->getPosition(match->homeTeamUid(),"Midfielder3"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Midfielder3"));
       match->m_home_player_skill.insert("Midfielder3",possitionSkills[4]);
       match->m_home_player_positions.insert("Attacker1",team->getPosition(match->homeTeamUid(),"Attacker1"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Attacker1"));
       match->m_home_player_skill.insert("Attacker1",possitionSkills[5]);
       match->m_home_player_positions.insert("Attacker2",team->getPosition(match->homeTeamUid(),"Attacker2"));
       possitionSkills=player->getPositionSkills(match->m_home_player_positions.value("Attacker2"));
       match->m_home_player_skill.insert("Attacker2",possitionSkills[5]);

       match->m_away_player_positions.insert("Goalkeeper",team->getPosition(match->awayTeamUid(),"Goalkeeper"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Goalkeeper"));
       match->m_away_player_skill.insert("Goalkeeper",possitionSkills[0]);
       match->m_away_player_positions.insert("Defender1",team->getPosition(match->awayTeamUid(),"Defender1"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Defender1"));
       match->m_away_player_skill.insert("Defender1",possitionSkills[1]);
       match->m_away_player_positions.insert("Defender2",team->getPosition(match->awayTeamUid(),"Defender2"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Defender2"));
       match->m_away_player_skill.insert("Defender2",possitionSkills[2]);
       match->m_away_player_positions.insert("Defender3",team->getPosition(match->awayTeamUid(),"Defender3"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Defender3"));
       match->m_away_player_skill.insert("Defender3",possitionSkills[2]);
       match->m_away_player_positions.insert("Defender4",team->getPosition(match->awayTeamUid(),"Defender4"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Defender4"));
       match->m_away_player_skill.insert("Defender4",possitionSkills[3]);
       match->m_away_player_positions.insert("Defender5",team->getPosition(match->awayTeamUid(),"Defender5"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Defender5"));
       match->m_away_player_skill.insert("Defender5",possitionSkills[3]);
       match->m_away_player_positions.insert("Midfielder1",team->getPosition(match->awayTeamUid(),"Midfielder1"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Midfielder1"));
       match->m_away_player_skill.insert("Midfielder1",possitionSkills[4]);
       match->m_away_player_positions.insert("Midfielder2",team->getPosition(match->awayTeamUid(),"Midfielder2"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Midfielder2"));
       match->m_away_player_skill.insert("Midfielder2",possitionSkills[4]);
       match->m_away_player_positions.insert("Midfielder3",team->getPosition(match->awayTeamUid(),"Midfielder3"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Midfielder3"));
       match->m_away_player_skill.insert("Midfielder3",possitionSkills[4]);
       match->m_away_player_positions.insert("Attacker1",team->getPosition(match->awayTeamUid(),"Attacker1"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Attacker1"));
       match->m_away_player_skill.insert("Attacker1",possitionSkills[5]);
       match->m_away_player_positions.insert("Attacker2",team->getPosition(match->awayTeamUid(),"Attacker2"));
       possitionSkills=player->getPositionSkills(match->m_away_player_positions.value("Attacker2"));
       match->m_away_player_skill.insert("Attacker2",possitionSkills[5]);

    }
}

void Match::matchTick(QString value, int min, int sec)
{
    Match *match =m_matches->value(value);
    int homeAttackSkill;
    int awayAttackSkill;
    int homeMidSkill;
    int awayMidSkill;
    int homeDefSkill;
    int awayDefSkill;
    int homeGoalSkill;
    int awayGoalSkill;
    int homeScore;
    int awayScore;
    int randNum;
    int hsChans;
    int asChans;
    if(match){
        homeGoalSkill=match->m_home_player_skill.value("Goalkeeper");
        homeDefSkill=match->m_home_player_skill.value("Defender1")*0.40+match->m_home_player_skill.value("Defender2")*0.20+match->m_home_player_skill.value("Defender3")*0.20+match->m_home_player_skill.value("Defender1")*0.10+match->m_home_player_skill.value("Defender1")*0.10;
        homeMidSkill=match->m_home_player_skill.value("Defender4")*0.05+match->m_home_player_skill.value("Defender5")*0.05+match->m_home_player_skill.value("Midfielder1")*0.30+match->m_home_player_skill.value("Midfielder2")*0.30+match->m_home_player_skill.value("Midfielder3")*0.30;
        homeAttackSkill=match->m_home_player_skill.value("Attacker1")*0.35+match->m_home_player_skill.value("Attacker1")*0.35+match->m_home_player_skill.value("Midfielder1")*0.10+match->m_home_player_skill.value("Midfielder2")*0.10+match->m_home_player_skill.value("Midfielder3")*0.10;
        awayGoalSkill=match->m_away_player_skill.value("Goalkeeper");
        awayDefSkill=match->m_away_player_skill.value("Defender1")*0.40+match->m_away_player_skill.value("Defender2")*0.20+match->m_away_player_skill.value("Defender3")*0.20+match->m_away_player_skill.value("Defender1")*0.10+match->m_away_player_skill.value("Defender1")*0.10;
        awayMidSkill=match->m_away_player_skill.value("Defender4")*0.05+match->m_away_player_skill.value("Defender5")*0.05+match->m_away_player_skill.value("Midfielder1")*0.30+match->m_away_player_skill.value("Midfielder2")*0.30+match->m_away_player_skill.value("Midfielder3")*0.30;
        awayAttackSkill=match->m_away_player_skill.value("Attacker1")*0.35+match->m_away_player_skill.value("Attacker1")*0.35+match->m_away_player_skill.value("Midfielder1")*0.10+match->m_away_player_skill.value("Midfielder2")*0.10+match->m_away_player_skill.value("Midfielder3")*0.10;
//        qDebug() << homeGoalSkill << " "<< homeDefSkill<< " "<< homeMidSkill << " "<< homeAttackSkill;
//        qDebug() << awayGoalSkill << " "<< awayDefSkill<< " "<< awayMidSkill << " "<< awayAttackSkill;
        homeScore=match->homeTeamScore();
        awayScore=match->awayTeamScore();
        if(sec%10==0){
            randNum=rand()%2000;
            hsChans=randNum+homeAttackSkill/10+homeMidSkill/20-awayDefSkill/20-awayGoalSkill/10;
            asChans=randNum-awayAttackSkill/10-awayMidSkill/20+homeDefSkill/20+homeGoalSkill/10;
            if(asChans<20)match->setAwayTeamScore(awayScore+1);
            if(hsChans>1980)match->setHomeTeamScore(homeScore+1);
        }
    }
}

QString Match::getMatchDay(QString value)
{
    Match *match =m_matches->value(value);
    int day;
    int month;
    int year;
    QDate matchDate;
    QString dateString;
    if(match){
        day=match->matchDay();
        month=match->matchMonth();
        year=match->matchYear();
        matchDate=QDate(year,month,day);
        dateString=matchDate.toString("yyyy-MM-dd");
        //qDebug() << matchDate.month();
        return dateString;
    }else{
        return "1900-01-01";
    }

}

int Match::getHomeResult(QString value)
{
    Match *match =m_matches->value(value);
    if(match){
        return match->homeTeamScore();
    }else{
        return -999;
    }

}

int Match::getAwayResult(QString value)
{
    Match *match =m_matches->value(value);
    if(match){
        return match->awayTeamScore();
    }else{
        return -999;
    }

}
