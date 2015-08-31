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

QString Match::getHomeTeamUid(QString value)
{
    Match *match =m_matches->value(value);
    qDebug() << value;
    if(match){
        qDebug() << match->homeTeamUid();
        return match->homeTeamUid();
    }else{
        return "error";
    }
}

QString Match::getAwayTeamUid(QString value)
{
    Match *match =m_matches->value(value);
    qDebug() << value;
    if(match){
        qDebug() << match->awayTeamUid();
        return match->awayTeamUid();
    }else{
        return "error";
    }

}
