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

void Serie::setTimesEach(int value)
{
    m_times_each=value;
    emit timesEachChanged();
}

int Serie::timesEach()
{
    return m_times_each;
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

QString Serie::getCountryByUid(QString value)
{
    Serie *serie = m_series->value(value);
    if (serie)
        return serie->countryUid();
    else
        return "error";

}

QStringList Serie::getAllUid()
{
    QStringList serieslist;
    QHash<QString, Serie *>::iterator i = m_series->begin();
    while (i != m_series->end()) {
        serieslist.append(i.key());
        ++i;
    }
    return serieslist;
}

void Serie::makeSchedule(QString value)
{
    Serie *serie = m_series->value(value);
    Match *newMatch;
    QStringList teams;
    int countTeams;
    QString uid;
    QList<int> homeTeams;
    QList<int> awayTeams;
    QList<int> day;
    QList<int> month;
    QList<int> year;
    int countGames=0;
    int times;
    if (serie){
        serie->m_match_list.clear();
        teams=serie->m_team_list;
        countTeams=teams.size();
        times=serie->timesEach();
        if(countTeams==6){
            if(times==2){
                countGames=30;
                // Round 1
                homeTeams.append(5); awayTeams.append(3); day.append(13); month.append(11); year.append(2015);
                homeTeams.append(4); awayTeams.append(2); day.append(13); month.append(11); year.append(2015);
                homeTeams.append(1); awayTeams.append(0); day.append(13); month.append(11); year.append(2015);
                // Round 2
                homeTeams.append(3); awayTeams.append(2); day.append(20); month.append(11); year.append(2015);
                homeTeams.append(0); awayTeams.append(5); day.append(20); month.append(11); year.append(2015);
                homeTeams.append(1); awayTeams.append(4); day.append(20); month.append(11); year.append(2015);
                // Round 3
                homeTeams.append(0); awayTeams.append(3); day.append(27); month.append(11); year.append(2015);
                homeTeams.append(2); awayTeams.append(1); day.append(27); month.append(11); year.append(2015);
                homeTeams.append(5); awayTeams.append(4); day.append(27); month.append(11); year.append(2015);
                // Round 4
                homeTeams.append(3); awayTeams.append(1); day.append(4); month.append(12); year.append(2015);
                homeTeams.append(4); awayTeams.append(0); day.append(4); month.append(12); year.append(2015);
                homeTeams.append(5); awayTeams.append(2); day.append(4); month.append(12); year.append(2015);
                // Round 5
                homeTeams.append(4); awayTeams.append(3); day.append(11); month.append(12); year.append(2015);
                homeTeams.append(1); awayTeams.append(5); day.append(11); month.append(12); year.append(2015);
                homeTeams.append(0); awayTeams.append(2); day.append(11); month.append(12); year.append(2015);
                // Round 6
                homeTeams.append(3); awayTeams.append(5); day.append(18); month.append(12); year.append(2015);
                homeTeams.append(2); awayTeams.append(4); day.append(18); month.append(12); year.append(2015);
                homeTeams.append(0); awayTeams.append(1); day.append(18); month.append(12); year.append(2015);
                // Round 7
                homeTeams.append(2); awayTeams.append(3); day.append(5); month.append(1); year.append(2016);
                homeTeams.append(5); awayTeams.append(0); day.append(5); month.append(1); year.append(2016);
                homeTeams.append(4); awayTeams.append(1); day.append(5); month.append(1); year.append(2016);
                // Round 8
                homeTeams.append(3); awayTeams.append(0); day.append(12); month.append(1); year.append(2016);
                homeTeams.append(1); awayTeams.append(2); day.append(12); month.append(1); year.append(2016);
                homeTeams.append(4); awayTeams.append(5); day.append(12); month.append(1); year.append(2016);
                // Round 9
                homeTeams.append(1); awayTeams.append(3); day.append(19); month.append(1); year.append(2016);
                homeTeams.append(0); awayTeams.append(4); day.append(19); month.append(1); year.append(2016);
                homeTeams.append(2); awayTeams.append(5); day.append(19); month.append(1); year.append(2016);
                // Round 10
                homeTeams.append(3); awayTeams.append(4); day.append(11); month.append(2); year.append(2016);
                homeTeams.append(5); awayTeams.append(1); day.append(11); month.append(2); year.append(2016);
                homeTeams.append(2); awayTeams.append(0); day.append(11); month.append(2); year.append(2016);

            }
        } else if (countTeams==14){
            if(times==2){
                countGames=49;
                // Round 1
                homeTeams.append(10); awayTeams.append(9); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(11); awayTeams.append(4); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(6); awayTeams.append(2); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(5); awayTeams.append(7); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(13); awayTeams.append(0); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(8); awayTeams.append(12); day.append(15); month.append(11); year.append(2015);
                homeTeams.append(1); awayTeams.append(3); day.append(15); month.append(11); year.append(2015);
                // Round 2
                homeTeams.append(9); awayTeams.append(4); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(2); awayTeams.append(10); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(7); awayTeams.append(11); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(0); awayTeams.append(6); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(12); awayTeams.append(5); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(3); awayTeams.append(13); day.append(18); month.append(11); year.append(2015);
                homeTeams.append(1); awayTeams.append(8); day.append(18); month.append(11); year.append(2015);
                // Round 3
                homeTeams.append(2); awayTeams.append(9); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(4); awayTeams.append(7); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(10); awayTeams.append(0); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(11); awayTeams.append(12); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(6); awayTeams.append(3); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(5); awayTeams.append(1); day.append(22); month.append(11); year.append(2015);
                homeTeams.append(13); awayTeams.append(8); day.append(22); month.append(11); year.append(2015);
                // Round 4
                homeTeams.append(9); awayTeams.append(7); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(0); awayTeams.append(2); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(12); awayTeams.append(4); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(3); awayTeams.append(10); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(1); awayTeams.append(11); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(8); awayTeams.append(6); day.append(25); month.append(11); year.append(2015);
                homeTeams.append(13); awayTeams.append(5); day.append(25); month.append(11); year.append(2015);
                // Round 5
                homeTeams.append(0); awayTeams.append(9); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(7); awayTeams.append(12); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(2); awayTeams.append(3); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(4); awayTeams.append(1); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(10); awayTeams.append(8); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(11); awayTeams.append(13); day.append(1); month.append(12); year.append(2015);
                homeTeams.append(6); awayTeams.append(5); day.append(1); month.append(12); year.append(2015);
                // Round 6
                homeTeams.append(9); awayTeams.append(12); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(3); awayTeams.append(0); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(1); awayTeams.append(7); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(8); awayTeams.append(2); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(13); awayTeams.append(4); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(5); awayTeams.append(10); day.append(5); month.append(12); year.append(2015);
                homeTeams.append(6); awayTeams.append(11); day.append(5); month.append(12); year.append(2015);
                // Round 7
                homeTeams.append(3); awayTeams.append(9); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(12); awayTeams.append(1); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(0); awayTeams.append(8); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(7); awayTeams.append(13); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(2); awayTeams.append(5); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(4); awayTeams.append(6); day.append(8); month.append(12); year.append(2015);
                homeTeams.append(10); awayTeams.append(11); day.append(8); month.append(12); year.append(2015);

            }
        }
        if(countGames>0){
            for(int i=0;i<countGames;i++){
                newMatch = new Match();
                newMatch->setHomeTeamUid(teams[homeTeams[i]]);
                newMatch->setAwayTeamUid(teams[awayTeams[i]]);
                newMatch->setMatchDay(day[i]);
                newMatch->setMatchMonth(month[i]);
                newMatch->setMatchYear(year[i]);
                uid=serie->uid()+teams[homeTeams[i]]+teams[awayTeams[i]];
                newMatch->setUid(uid);
                serie->m_match_list.append(uid);
            }
        }
    }
}

