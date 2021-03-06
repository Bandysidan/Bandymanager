#include "serie.h"
#include "generalfunctions.h"

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

void Serie::setStartMonth(int value)
{
    m_start_month=value;
    emit startMonthChanged();
}

int Serie::startMonth()
{
    return m_start_month;
}

void Serie::setEndMonth(int value)
{
    m_end_month=value;
    emit endMonthChanged();
}

int Serie::endMonth()
{
        return m_end_month;
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
    int countRounds;
    QString uid;
    QList<int> homeTeams;
    QList<int> awayTeams;
    QList<int> day;
    QList<int> month;
    QList<int> year;
    int playDay;
    int playMonth;
    int playYear;
    int season=2015;
    int firstMonth;
    int lastMonth;
    QList<QDate> playDates;
    QDate first;
    QDate last;
    int countGames=0;
    int times;
    QString si;
    if (serie){
        serie->m_match_list.clear();
        teams=serie->m_team_list;
        countTeams=teams.size();
        times=serie->timesEach();
        if(countTeams%2==0)
            countRounds=(countTeams-1)*times;
        else
            countRounds=(countTeams)*times;
        firstMonth=serie->startMonth();
        lastMonth=serie->endMonth();
        if(firstMonth>6 && firstMonth<=12)
            first=QDate(season,firstMonth,01);
        else
            first=QDate(season+1,firstMonth,01);
        if(lastMonth>6 && lastMonth<=12)
            last=QDate(season,lastMonth,01);
        else
            last=QDate(season+1,lastMonth,28);
        playDates=spreadDates(first,last,countRounds,1,6);
        if(countTeams%2==0)
            countGames=countRounds*countTeams/2;
        else
            countGames=countRounds*(countTeams-1)/2;
        for(int i=0;i<countRounds;i++){
            playDay=playDates[i].day(); playMonth=playDates[i].month(); playYear=playDates[i].year();
            for(int j=0;j<countTeams/2;j++){
                 day.append(playDay); month.append(playMonth); year.append(playYear);
            }
        }
        if(countTeams==4){
            if(times==2 || times==3 || times==4){
                // Round 1
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(1);
                // Round 2
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(3);
                // Round 3
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(3);
                // Round 4
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(2);
                // Round 5
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(2);
                // Round 6
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(1);
            }
            if(times==1 || times==3 || times==4){
                // Round 1 / Round 7
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(1);
                // Round 2 / Round 8
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(3);
                // Round 3 / Round 9
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(3);
            }
            if(times==4){
                // Round 10
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(2);
                // Round 11
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(2);
                // Round 12
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(1);
            }
        } else if(countTeams==5){
            if(times==2 || times==3){
                // Round 1
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(0);
                // Round 2
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(4);
                // Round 3
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                // Round 4
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(0);
                // Round 5
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(2);
                // Round 6
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(1);
                // Round 7
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(1);
                // Round 8
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(2);
                // Round 9
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(4);
                // Round 10
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(0);
            }
            if(times==1 || times==3){
                // Round 1 / 11
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(0);
                // Round 2 / 12
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(4);
                // Round 3 / 13
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                // Round 4 / 14
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(0);
                // Round 5 / 15
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(2);
            }
        } else if(countTeams==6){
            if(times==2 || times==3){
                // Round 1
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(0);
                // Round 2
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(4);
                // Round 3
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(4);
                // Round 4
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(2);
                // Round 5
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(2);
                // Round 6
                homeTeams.append(3); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(1);
                // Round 7
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(4); awayTeams.append(1);
                // Round 8
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(5);
                // Round 9
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(5);
                // Round 10
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(0);
            }
            if(times==1 || times==3){
                // Round 1
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(0);
                // Round 2
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(4);
                // Round 3
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(4);
                // Round 4
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(2);
                // Round 5
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(2);
            }
        } else if (countTeams==8){
            if(times==2 || times==3){
                // Round 1
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(3);
                // Round 2
                homeTeams.append(5); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(0);
                // Round 3
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(6); awayTeams.append(0);
                // Round 4
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(7);
                // Round 5
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(2); awayTeams.append(7);
                // Round 6
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                // Round 7
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(1);
                // Round 8
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(4);
                // Round 9
                homeTeams.append(2); awayTeams.append(5);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(4);
                // Round 10
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(0); awayTeams.append(6);
                // Round 11
                homeTeams.append(3); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(6);
                // Round 12
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(2);
                // Round 13
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(6);
                homeTeams.append(3); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(2);
                // Round 14
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(3);
            }
            if(times==1 || times==3){
                // Round 1  / 15
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(3);
                // Round 2 / 16
                homeTeams.append(5); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(0);
                // Round 3 / 17
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(6); awayTeams.append(0);
                // Round 4 / 18
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(7);
                // Round 5 / 19
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(2); awayTeams.append(7);
                // Round 6 / 20
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(1);
                // Round 7 / 21
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(1);
            }
        } else if (countTeams==9){
            if(times==2){
                // Round 1
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(8); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(1);
                // Round 2
                homeTeams.append(6); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(8);
                homeTeams.append(7); awayTeams.append(3);
                // Round 3
                homeTeams.append(4); awayTeams.append(6);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(8); awayTeams.append(3);
                // Round 4
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(5);
                // Round 5
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(8);
                // Round 6
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(2);
                // Round 7
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(2);
                // Round 8
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(0);
                // Round 9
                homeTeams.append(8); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(0);
                // Round 10
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(7);
                // Round 11
                homeTeams.append(2); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(7);
                // Round 12
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(8);
                // Round 13
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(3);
                // Round 14
                homeTeams.append(6); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(2);
                // Round 15
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(5);
                // Round 16
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(8); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(4);
                // Round 17
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(4);
                // Round 18
                homeTeams.append(5); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(0); awayTeams.append(1);

            }
        } else if (countTeams==10){
            if(times==2){
                // Round 1
                homeTeams.append(3); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(9); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(4);
                // Round 2
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(9);
                // Round 3
                homeTeams.append(5); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(0); awayTeams.append(9);
                // Round 4
                homeTeams.append(8); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(9); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(2);
                // Round 5
                homeTeams.append(4); awayTeams.append(8);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(9);
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(2);
                // Round 6
                homeTeams.append(8); awayTeams.append(7);
                homeTeams.append(9); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(6);
                // Round 7
                homeTeams.append(9); awayTeams.append(8);
                homeTeams.append(7); awayTeams.append(0);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(6);
                // Round 8
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(9);
                homeTeams.append(3); awayTeams.append(7);
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(1);
                // Round 9
                homeTeams.append(2); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(9); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(1);
                // Round 10
                homeTeams.append(8); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(2);
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(9);
                homeTeams.append(4); awayTeams.append(7);
                // Round 11
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(3); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(9); awayTeams.append(7);
                // Round 12
                homeTeams.append(8); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(9); awayTeams.append(0);
                // Round 13
                homeTeams.append(1); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(3); awayTeams.append(9);
                homeTeams.append(2); awayTeams.append(0);
                // Round 14
                homeTeams.append(8); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(9); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(2); awayTeams.append(3);
                // Round 15
                homeTeams.append(7); awayTeams.append(8);
                homeTeams.append(4); awayTeams.append(9);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(3);
                // Round 16
                homeTeams.append(8); awayTeams.append(9);
                homeTeams.append(0); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(6); awayTeams.append(5);
                // Round 17
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(9); awayTeams.append(2);
                homeTeams.append(7); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(5);
                // Round 18
                homeTeams.append(8); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(9);
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(4);
            }
        } else if (countTeams==11){
            if(times==2){
                // Round 1
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(9); awayTeams.append(6);
                homeTeams.append(10); awayTeams.append(1);
                // Round 2
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(10); awayTeams.append(9);
                // Round 3
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(8); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(10);
                homeTeams.append(3); awayTeams.append(9);
                // Round 4
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(9); awayTeams.append(8);
                homeTeams.append(3); awayTeams.append(7);
                // Round 5
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(10);
                homeTeams.append(0); awayTeams.append(9);
                homeTeams.append(8); awayTeams.append(7);
                // Round 6
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(10); awayTeams.append(6);
                homeTeams.append(9); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(5);
                homeTeams.append(7); awayTeams.append(0);
                // Round 7
                homeTeams.append(10); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(9);
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(8);
                // Round 8
                homeTeams.append(4); awayTeams.append(9);
                homeTeams.append(3); awayTeams.append(10);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(5);
                // Round 9
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(9); awayTeams.append(7);
                homeTeams.append(10); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(5);
                // Round 10
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(8); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(10);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(6);
                // Round 11
                homeTeams.append(8); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(9); awayTeams.append(5);
                homeTeams.append(10); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(6);
                // Round 12
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(9);
                homeTeams.append(1); awayTeams.append(10);
                // Round 13
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(2);
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(9); awayTeams.append(10);
                // Round 14
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(8);
                homeTeams.append(10); awayTeams.append(7);
                homeTeams.append(9); awayTeams.append(3);
                // Round 15
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(8); awayTeams.append(9);
                homeTeams.append(7); awayTeams.append(3);
                // Round 16
                homeTeams.append(4); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(10); awayTeams.append(5);
                homeTeams.append(9); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(8);
                // Round 17
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(6); awayTeams.append(10);
                homeTeams.append(2); awayTeams.append(9);
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(7);
                // Round 18
                homeTeams.append(4); awayTeams.append(10);
                homeTeams.append(9); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(8); awayTeams.append(5);
                // Round 19
                homeTeams.append(9); awayTeams.append(4);
                homeTeams.append(10); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(0);
                // Round 20
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(9);
                homeTeams.append(8); awayTeams.append(10);
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(2);
                // Round 21
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(8);
                homeTeams.append(10); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(2);
                // Round 22
                homeTeams.append(4); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(9);
                homeTeams.append(2); awayTeams.append(10);
                homeTeams.append(6); awayTeams.append(1);

            }
        } else if (countTeams==12){
            if(times==2){
                // Round 1
                homeTeams.append(11); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(9); awayTeams.append(6);
                homeTeams.append(10); awayTeams.append(1);
                // Round 2
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(11);
                homeTeams.append(2); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(3);
                homeTeams.append(10); awayTeams.append(9);
                // Round 3
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(11); awayTeams.append(6);
                homeTeams.append(8); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(10);
                homeTeams.append(3); awayTeams.append(9);
                // Round 4
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(10); awayTeams.append(11);
                homeTeams.append(9); awayTeams.append(8);
                homeTeams.append(3); awayTeams.append(7);
                // Round 5
                homeTeams.append(6); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(10);
                homeTeams.append(0); awayTeams.append(9);
                homeTeams.append(11); awayTeams.append(3);
                homeTeams.append(8); awayTeams.append(7);
                // Round 6
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(10); awayTeams.append(6);
                homeTeams.append(9); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(5);
                homeTeams.append(7); awayTeams.append(0);
                homeTeams.append(8); awayTeams.append(11);
                // Round 7
                homeTeams.append(10); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(9);
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(11);
                // Round 8
                homeTeams.append(4); awayTeams.append(9);
                homeTeams.append(3); awayTeams.append(10);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(11); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(5);
                // Round 9
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(9); awayTeams.append(7);
                homeTeams.append(10); awayTeams.append(8);
                homeTeams.append(1); awayTeams.append(11);
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(5);
                // Round 10
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(8); awayTeams.append(3);
                homeTeams.append(11); awayTeams.append(9);
                homeTeams.append(0); awayTeams.append(10);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(6);
                // Round 11
                homeTeams.append(8); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(11);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(9); awayTeams.append(5);
                homeTeams.append(10); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(6);
                // Round 12
                homeTeams.append(4); awayTeams.append(11);
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(9);
                homeTeams.append(1); awayTeams.append(10);
                // Round 13
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(11); awayTeams.append(5);
                homeTeams.append(8); awayTeams.append(2);
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(3); awayTeams.append(1);
                homeTeams.append(9); awayTeams.append(10);
                // Round 14
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(11);
                homeTeams.append(1); awayTeams.append(8);
                homeTeams.append(10); awayTeams.append(7);
                homeTeams.append(9); awayTeams.append(3);
                // Round 15
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(11); awayTeams.append(10);
                homeTeams.append(8); awayTeams.append(9);
                homeTeams.append(7); awayTeams.append(3);
                // Round 16
                homeTeams.append(4); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(10); awayTeams.append(5);
                homeTeams.append(9); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(11);
                homeTeams.append(7); awayTeams.append(8);
                // Round 17
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(6); awayTeams.append(10);
                homeTeams.append(2); awayTeams.append(9);
                homeTeams.append(5); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(7);
                homeTeams.append(11); awayTeams.append(8);
                // Round 18
                homeTeams.append(4); awayTeams.append(10);
                homeTeams.append(9); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(8); awayTeams.append(5);
                homeTeams.append(11); awayTeams.append(0);
                // Round 19
                homeTeams.append(9); awayTeams.append(4);
                homeTeams.append(10); awayTeams.append(3);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(11);
                homeTeams.append(5); awayTeams.append(0);
                // Round 20
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(9);
                homeTeams.append(8); awayTeams.append(10);
                homeTeams.append(11); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(2);
                // Round 21
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(8);
                homeTeams.append(9); awayTeams.append(11);
                homeTeams.append(10); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(2);
                // Round 22
                homeTeams.append(4); awayTeams.append(8);
                homeTeams.append(11); awayTeams.append(7);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(9);
                homeTeams.append(2); awayTeams.append(10);
                homeTeams.append(6); awayTeams.append(1);

            }
        } else if (countTeams==13){
            if(times==2){
                // Round 1
                homeTeams.append(0); awayTeams.append(10);
                homeTeams.append(7); awayTeams.append(12);
                homeTeams.append(11); awayTeams.append(2);
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(8);
                // Round 2
                homeTeams.append(10); awayTeams.append(12);
                homeTeams.append(9); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(11);
                homeTeams.append(8); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(3);
                // Round 3
                homeTeams.append(9); awayTeams.append(10);
                homeTeams.append(12); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(11); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(3);
                // Round 4
                homeTeams.append(10); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(9);
                homeTeams.append(4); awayTeams.append(12);
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(11);
                // Round 5
                homeTeams.append(6); awayTeams.append(10);
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(9); awayTeams.append(8);
                homeTeams.append(12); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(5);
                // Round 6
                homeTeams.append(10); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(9);
                homeTeams.append(5); awayTeams.append(12);
                homeTeams.append(11); awayTeams.append(0);
                // Round 7
                homeTeams.append(8); awayTeams.append(10);
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(5);
                homeTeams.append(9); awayTeams.append(11);
                homeTeams.append(0); awayTeams.append(7);
                // Round 8
                homeTeams.append(10); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(11); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(9);
                homeTeams.append(0); awayTeams.append(12);
                // Round 9
                homeTeams.append(3); awayTeams.append(10);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(8); awayTeams.append(11);
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(9); awayTeams.append(12);
                // Round 10
                homeTeams.append(10); awayTeams.append(5);
                homeTeams.append(11); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(12); awayTeams.append(6);
                homeTeams.append(9); awayTeams.append(2);
                // Round 11
                homeTeams.append(11); awayTeams.append(10);
                homeTeams.append(3); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(8); awayTeams.append(12);
                homeTeams.append(4); awayTeams.append(9);
                homeTeams.append(6); awayTeams.append(2);
                // Round 12
                homeTeams.append(7); awayTeams.append(11);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(12); awayTeams.append(3);
                homeTeams.append(9); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(4);
                // Round 13
                homeTeams.append(7); awayTeams.append(10);
                homeTeams.append(11); awayTeams.append(12);
                homeTeams.append(5); awayTeams.append(9);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(8); awayTeams.append(4);
                // Round 14
                homeTeams.append(10); awayTeams.append(0);
                homeTeams.append(12); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(11);
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(8); awayTeams.append(1);
                // Round 15
                homeTeams.append(12); awayTeams.append(10);
                homeTeams.append(0); awayTeams.append(9);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(11); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(8);
                homeTeams.append(3); awayTeams.append(1);
                // Round 16
                homeTeams.append(10); awayTeams.append(9);
                homeTeams.append(2); awayTeams.append(12);
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(11);
                homeTeams.append(3); awayTeams.append(5);
                // Round 17
                homeTeams.append(2); awayTeams.append(10);
                homeTeams.append(9); awayTeams.append(6);
                homeTeams.append(12); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(11); awayTeams.append(5);
                // Round 18
                homeTeams.append(10); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(8); awayTeams.append(9);
                homeTeams.append(1); awayTeams.append(12);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(7);
                // Round 19
                homeTeams.append(4); awayTeams.append(10);
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(9); awayTeams.append(3);
                homeTeams.append(12); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(11);
                // Round 20
                homeTeams.append(10); awayTeams.append(8);
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(2);
                homeTeams.append(11); awayTeams.append(9);
                homeTeams.append(7); awayTeams.append(0);
                // Round 21
                homeTeams.append(1); awayTeams.append(10);
                homeTeams.append(8); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(11);
                homeTeams.append(9); awayTeams.append(7);
                homeTeams.append(12); awayTeams.append(0);
                // Round 22
                homeTeams.append(10); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(11); awayTeams.append(8);
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(12); awayTeams.append(9);
                // Round 23
                homeTeams.append(5); awayTeams.append(10);
                homeTeams.append(3); awayTeams.append(11);
                homeTeams.append(8); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(12);
                homeTeams.append(2); awayTeams.append(9);
                // Round 24
                homeTeams.append(10); awayTeams.append(11);
                homeTeams.append(7); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(12); awayTeams.append(8);
                homeTeams.append(9); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(6);
                // Round 25
                homeTeams.append(11); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(12);
                homeTeams.append(1); awayTeams.append(9);
                homeTeams.append(8); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(6);
                // Round 26
                homeTeams.append(10); awayTeams.append(7);
                homeTeams.append(12); awayTeams.append(11);
                homeTeams.append(9); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(8);
            }
        } else if (countTeams==14){
            if(times==2){
                // Round 1
                homeTeams.append(0); awayTeams.append(10);
                homeTeams.append(7); awayTeams.append(12);
                homeTeams.append(13); awayTeams.append(9);
                homeTeams.append(11); awayTeams.append(2);
                homeTeams.append(5); awayTeams.append(6);
                homeTeams.append(3); awayTeams.append(4);
                homeTeams.append(1); awayTeams.append(8);
                // Round 2
                homeTeams.append(10); awayTeams.append(12);
                homeTeams.append(9); awayTeams.append(0);
                homeTeams.append(2); awayTeams.append(7);
                homeTeams.append(6); awayTeams.append(13);
                homeTeams.append(4); awayTeams.append(11);
                homeTeams.append(8); awayTeams.append(5);
                homeTeams.append(1); awayTeams.append(3);
                // Round 3
                homeTeams.append(9); awayTeams.append(10);
                homeTeams.append(12); awayTeams.append(2);
                homeTeams.append(0); awayTeams.append(6);
                homeTeams.append(7); awayTeams.append(4);
                homeTeams.append(13); awayTeams.append(8);
                homeTeams.append(11); awayTeams.append(1);
                homeTeams.append(5); awayTeams.append(3);
                // Round 4
                homeTeams.append(10); awayTeams.append(2);
                homeTeams.append(6); awayTeams.append(9);
                homeTeams.append(4); awayTeams.append(12);
                homeTeams.append(8); awayTeams.append(0);
                homeTeams.append(1); awayTeams.append(7);
                homeTeams.append(3); awayTeams.append(13);
                homeTeams.append(5); awayTeams.append(11);
                // Round 5
                homeTeams.append(6); awayTeams.append(10);
                homeTeams.append(2); awayTeams.append(4);
                homeTeams.append(9); awayTeams.append(8);
                homeTeams.append(12); awayTeams.append(1);
                homeTeams.append(0); awayTeams.append(3);
                homeTeams.append(7); awayTeams.append(5);
                homeTeams.append(13); awayTeams.append(11);
                // Round 6
                homeTeams.append(10); awayTeams.append(4);
                homeTeams.append(8); awayTeams.append(6);
                homeTeams.append(1); awayTeams.append(2);
                homeTeams.append(3); awayTeams.append(9);
                homeTeams.append(5); awayTeams.append(12);
                homeTeams.append(11); awayTeams.append(0);
                homeTeams.append(13); awayTeams.append(7);
                // Round 7
                homeTeams.append(8); awayTeams.append(10);
                homeTeams.append(4); awayTeams.append(1);
                homeTeams.append(6); awayTeams.append(3);
                homeTeams.append(2); awayTeams.append(5);
                homeTeams.append(9); awayTeams.append(11);
                homeTeams.append(12); awayTeams.append(13);
                homeTeams.append(0); awayTeams.append(7);
                // Round 8
                homeTeams.append(10); awayTeams.append(1);
                homeTeams.append(3); awayTeams.append(8);
                homeTeams.append(5); awayTeams.append(4);
                homeTeams.append(11); awayTeams.append(6);
                homeTeams.append(13); awayTeams.append(2);
                homeTeams.append(7); awayTeams.append(9);
                homeTeams.append(0); awayTeams.append(12);
                // Round 9
                homeTeams.append(3); awayTeams.append(10);
                homeTeams.append(1); awayTeams.append(5);
                homeTeams.append(8); awayTeams.append(11);
                homeTeams.append(4); awayTeams.append(13);
                homeTeams.append(6); awayTeams.append(7);
                homeTeams.append(2); awayTeams.append(0);
                homeTeams.append(9); awayTeams.append(12);
                // Round 10
                homeTeams.append(10); awayTeams.append(5);
                homeTeams.append(11); awayTeams.append(3);
                homeTeams.append(13); awayTeams.append(1);
                homeTeams.append(7); awayTeams.append(8);
                homeTeams.append(0); awayTeams.append(4);
                homeTeams.append(12); awayTeams.append(6);
                homeTeams.append(9); awayTeams.append(2);
                // Round 11
                homeTeams.append(11); awayTeams.append(10);
                homeTeams.append(5); awayTeams.append(13);
                homeTeams.append(3); awayTeams.append(7);
                homeTeams.append(1); awayTeams.append(0);
                homeTeams.append(8); awayTeams.append(12);
                homeTeams.append(4); awayTeams.append(9);
                homeTeams.append(6); awayTeams.append(2);
                // Round 12
                homeTeams.append(10); awayTeams.append(13);
                homeTeams.append(7); awayTeams.append(11);
                homeTeams.append(0); awayTeams.append(5);
                homeTeams.append(12); awayTeams.append(3);
                homeTeams.append(9); awayTeams.append(1);
                homeTeams.append(2); awayTeams.append(8);
                homeTeams.append(6); awayTeams.append(4);
                // Round 13
                homeTeams.append(7); awayTeams.append(10);
                homeTeams.append(13); awayTeams.append(0);
                homeTeams.append(11); awayTeams.append(12);
                homeTeams.append(5); awayTeams.append(9);
                homeTeams.append(3); awayTeams.append(2);
                homeTeams.append(1); awayTeams.append(6);
                homeTeams.append(8); awayTeams.append(4);
                // Round 14
                homeTeams.append(10); awayTeams.append(0);
                homeTeams.append(12); awayTeams.append(7);
                homeTeams.append(9); awayTeams.append(13);
                homeTeams.append(2); awayTeams.append(11);
                homeTeams.append(6); awayTeams.append(5);
                homeTeams.append(4); awayTeams.append(3);
                homeTeams.append(8); awayTeams.append(1);
                // Round 15
                homeTeams.append(12); awayTeams.append(10);
                homeTeams.append(0); awayTeams.append(9);
                homeTeams.append(7); awayTeams.append(2);
                homeTeams.append(13); awayTeams.append(6);
                homeTeams.append(11); awayTeams.append(4);
                homeTeams.append(5); awayTeams.append(8);
                homeTeams.append(3); awayTeams.append(1);
                // Round 16
                homeTeams.append(10); awayTeams.append(9);
                homeTeams.append(2); awayTeams.append(12);
                homeTeams.append(6); awayTeams.append(0);
                homeTeams.append(4); awayTeams.append(7);
                homeTeams.append(8); awayTeams.append(13);
                homeTeams.append(1); awayTeams.append(11);
                homeTeams.append(3); awayTeams.append(5);
                // Round 17
                homeTeams.append(2); awayTeams.append(10);
                homeTeams.append(9); awayTeams.append(6);
                homeTeams.append(12); awayTeams.append(4);
                homeTeams.append(0); awayTeams.append(8);
                homeTeams.append(7); awayTeams.append(1);
                homeTeams.append(13); awayTeams.append(3);
                homeTeams.append(11); awayTeams.append(5);
                // Round 18
                homeTeams.append(10); awayTeams.append(6);
                homeTeams.append(4); awayTeams.append(2);
                homeTeams.append(8); awayTeams.append(9);
                homeTeams.append(1); awayTeams.append(12);
                homeTeams.append(3); awayTeams.append(0);
                homeTeams.append(5); awayTeams.append(7);
                homeTeams.append(11); awayTeams.append(13);
                // Round 19
                homeTeams.append(4); awayTeams.append(10);
                homeTeams.append(6); awayTeams.append(8);
                homeTeams.append(2); awayTeams.append(1);
                homeTeams.append(9); awayTeams.append(3);
                homeTeams.append(12); awayTeams.append(5);
                homeTeams.append(0); awayTeams.append(11);
                homeTeams.append(7); awayTeams.append(13);
                // Round 20
                homeTeams.append(10); awayTeams.append(8);
                homeTeams.append(1); awayTeams.append(4);
                homeTeams.append(3); awayTeams.append(6);
                homeTeams.append(5); awayTeams.append(2);
                homeTeams.append(11); awayTeams.append(9);
                homeTeams.append(13); awayTeams.append(12);
                homeTeams.append(7); awayTeams.append(0);
                // Round 21
                homeTeams.append(1); awayTeams.append(10);
                homeTeams.append(8); awayTeams.append(3);
                homeTeams.append(4); awayTeams.append(5);
                homeTeams.append(6); awayTeams.append(11);
                homeTeams.append(2); awayTeams.append(13);
                homeTeams.append(9); awayTeams.append(7);
                homeTeams.append(12); awayTeams.append(0);
                // Round 22
                homeTeams.append(10); awayTeams.append(3);
                homeTeams.append(5); awayTeams.append(1);
                homeTeams.append(11); awayTeams.append(8);
                homeTeams.append(13); awayTeams.append(4);
                homeTeams.append(7); awayTeams.append(6);
                homeTeams.append(0); awayTeams.append(2);
                homeTeams.append(12); awayTeams.append(9);
                // Round 23
                homeTeams.append(5); awayTeams.append(10);
                homeTeams.append(3); awayTeams.append(11);
                homeTeams.append(1); awayTeams.append(13);
                homeTeams.append(8); awayTeams.append(7);
                homeTeams.append(4); awayTeams.append(0);
                homeTeams.append(6); awayTeams.append(12);
                homeTeams.append(2); awayTeams.append(9);
                // Round 24
                homeTeams.append(10); awayTeams.append(11);
                homeTeams.append(13); awayTeams.append(5);
                homeTeams.append(7); awayTeams.append(3);
                homeTeams.append(0); awayTeams.append(1);
                homeTeams.append(12); awayTeams.append(8);
                homeTeams.append(9); awayTeams.append(4);
                homeTeams.append(2); awayTeams.append(6);
                // Round 25
                homeTeams.append(13); awayTeams.append(10);
                homeTeams.append(11); awayTeams.append(7);
                homeTeams.append(5); awayTeams.append(0);
                homeTeams.append(3); awayTeams.append(12);
                homeTeams.append(1); awayTeams.append(9);
                homeTeams.append(8); awayTeams.append(2);
                homeTeams.append(4); awayTeams.append(6);
                // Round 26
                homeTeams.append(10); awayTeams.append(7);
                homeTeams.append(0); awayTeams.append(13);
                homeTeams.append(12); awayTeams.append(11);
                homeTeams.append(9); awayTeams.append(5);
                homeTeams.append(2); awayTeams.append(3);
                homeTeams.append(6); awayTeams.append(1);
                homeTeams.append(4); awayTeams.append(8);
            }
        }
        if(countGames>0){
            for(int i=0;i<countGames;i++){
                si=QString::number(i);
                newMatch = new Match();
                newMatch->setHomeTeamUid(teams[homeTeams[i]]);
                newMatch->setAwayTeamUid(teams[awayTeams[i]]);
                newMatch->setMatchDay(day[i]);
                newMatch->setMatchMonth(month[i]);
                newMatch->setMatchYear(year[i]);
                uid=serie->uid()+si+teams[homeTeams[i]]+teams[awayTeams[i]];
                newMatch->setUid(uid);
                serie->m_match_list.append(uid);
            }
        }
    }
}

