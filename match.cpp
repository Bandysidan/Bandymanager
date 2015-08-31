#include "match.h"

QHash<QString,Match *> *Match::m_matches;

Match::Match(QObject *parent) :
    QObject(parent)
{
    if(!m_matches)
        m_matches= new QHash<QString,Match *>();

}

void Match::setUid(QString value)
{
    m_uid = value;
    m_matches->insert(m_uid,this);
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
    //qDebug() << value;
    if(match){
        //qDebug() << match->homeTeamUid();
        return match->homeTeamUid();
    }else{
        return "error";
    }
}

QString Match::getAwayTeamUid(QString value)
{
    Match *match =m_matches->value(value);
    //qDebug() << value;
    if(match){
        //qDebug() << match->awayTeamUid();
        return match->awayTeamUid();
    }else{
        return "error";
    }

}

void Match::matchTick(QString value, int min, int sec)
{
    Match *match =m_matches->value(value);
    int homeScore;
    int awayScore;
    if(match){
        homeScore=match->homeTeamScore();
        awayScore=match->awayTeamScore();
        if(min==5 && sec==7){
            match->setAwayTeamScore(awayScore+1);
        }
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
