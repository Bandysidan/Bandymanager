#include "serie.h"

QHash<QString,Serie *> *Serie::m_series;
QMultiHash<QString,QString> *Serie::m_series_by_country;



Serie::Serie(QObject *parent) :
    QObject(parent)
{
    if(!m_series)
        m_series= new QHash<QString,Serie *>();
    if(!m_series_by_country)
        m_series_by_country = new QMultiHash<QString,QString>();

}

void Serie::setUid(QString value)
{
    m_uid = value;
    m_series->insert(m_uid, this);
    m_series_by_country->insert(m_country_uid,m_uid);
//    qDebug() << m_uid << " " << m_country_uid;
    emit uidChanged();

}

QString Serie::uid()
{
    return m_uid;
}

void Serie::setName(QString value)
{
    m_name = value;
    emit nameChanged();

}

QString Serie::name()
{
    return m_name;
}

void Serie::setCountryUid(QString value)
{
    m_country_uid = value;
    emit countryUidChanged();

}

QString Serie::countryUid()
{
    return m_country_uid;
}

void Serie::setTeamUid(QStringList value)
{
    m_team_list=value;
    emit teamUidChanged();
}

QStringList Serie::teamUid()
{
    return m_team_list;
}

void Serie::setMatchUid(QStringList value)
{
    m_match_list=value;
    emit matchUidChanged();

}

QStringList Serie::matchUid()
{
    return m_match_list;
}

QString Serie::getNameByUid(QString value)
{
    Serie *serie = m_series->value(value);
    if (serie)
        return serie->name();
    else
        return "error";

}

QStringList Serie::getTeamsByUid(QString value)
{
    Serie *serie = m_series->value(value);
    QStringList errorlist;
    errorlist.append("error");
    if (serie)
        return serie->teamUid();
    else
        return errorlist;

}

QStringList Serie::getMatchesByUid(QString value)
{
    Serie *serie = m_series->value(value);
    QStringList errorlist;
    errorlist.append("error");
    if (serie)
        return serie->matchUid();
    else
        return errorlist;

}

QStringList Serie::getUidByCountryUid(QString value)
{
    QStringList values = m_series_by_country->values(value);

    return values;

}

void Serie::makeSchedule(QString value)
{
    Serie *serie = m_series->value(value);
    Match *newMatch;
    QStringList teams;
    int countTeams;
    QString uid;
    if (serie){
        serie->m_match_list.clear();
        teams=serie->m_team_list;
        countTeams=teams.count();
        if(countTeams==6){
//            qDebug()<< "Debug" << teams[0];

            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[5]);
            newMatch->setAwayTeamUid(teams[3]);
            newMatch->setMatchDay(13);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[5]+teams[3];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[4]);
            newMatch->setAwayTeamUid(teams[2]);
            newMatch->setMatchDay(13);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[4]+teams[2];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[1]);
            newMatch->setAwayTeamUid(teams[0]);
            newMatch->setMatchDay(13);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[1]+teams[0];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);

            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[3]);
            newMatch->setAwayTeamUid(teams[2]);
            newMatch->setMatchDay(20);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[3]+teams[2];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[0]);
            newMatch->setAwayTeamUid(teams[5]);
            newMatch->setMatchDay(20);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[0]+teams[5];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[1]);
            newMatch->setAwayTeamUid(teams[4]);
            newMatch->setMatchDay(20);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[1]+teams[4];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);

            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[0]);
            newMatch->setAwayTeamUid(teams[3]);
            newMatch->setMatchDay(27);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[0]+teams[3];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[2]);
            newMatch->setAwayTeamUid(teams[1]);
            newMatch->setMatchDay(27);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[2]+teams[1];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);
            newMatch = new Match();
            newMatch->setHomeTeamUid(teams[5]);
            newMatch->setAwayTeamUid(teams[4]);
            newMatch->setMatchDay(27);
            newMatch->setMatchMonth(11);
            newMatch->setMatchYear(2015);
            uid=serie->uid()+teams[5]+teams[4];
            newMatch->setUid(uid);
            serie->m_match_list.append(uid);

        }
    }

}

