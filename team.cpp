#include "team.h"

QHash<QString,Team *> *Team::m_teams;
QMultiHash<QString,QString> *Team::m_teams_by_country;

Team::Team(QObject *parent) :
    QObject(parent)
{
    if(!m_teams)
        m_teams= new QHash<QString,Team *>();
    if(!m_teams_by_country)
        m_teams_by_country = new QMultiHash<QString,QString>();

}

void Team::setUid(QString value)
{
    m_uid = value;
    m_teams->insert(m_uid, this);
    m_teams_by_country->insert(m_country_uid,m_uid);
 /*      int i;
         i=m_teams_by_country->count();
         qDebug()<<"setUid: "<< i << " "<< m_uid << " "<< m_country_uid;
         QList<QString> teamFilter = m_teams_by_country->values(m_country_uid);
         //QHash<QString> teamFilter = m_teams_by_country->find(m_uid);
         qDebug() << m_teams_by_country->count() << " "<< teamFilter.count();
         for (int j = 0; j < teamFilter.size(); ++j)
           qDebug() << j <<" "<<teamFilter.at(j) ;
*/

    emit uidChanged();
}

QString Team::uid()
{
     return m_uid;

}

void Team::setName(QString value)
{
    m_name = value;
    emit nameChanged();
}

QString Team::name()
{
    return m_name;
}

void Team::setCountryUid(QString value)
{
    m_country_uid = value;
//    qDebug()<<"setCountryUid: "<< m_uid << " "<< m_country_uid;

    emit countryUidChanged();

}

QString Team::countryUid()
{
    return m_country_uid;
}

QString Team::getNameByUid(QString value)
{
    Team *team = m_teams->value(value);
    if (team)
        return team->name();
    else
        return "error";
}

QStringList Team::getUidByCountryUid(QString value)
{
    QStringList values = m_teams_by_country->values(value);
    values.sort();

    return values;

}

void Team::setPosition(QString position, QString player)
{
    QStringList possiblePosition;
    possiblePosition<<"Goalkeeper"<<"Defender1"<<"Defender2"<<"Defender3"<<"Defender4"<<"Defender5"<<"Midfielder1"<<"Midfielder2"<<"Midfielder3"<<"Attacker1"<<"Attacker2"<<"ReserveKeeper"<<"Substitution1"<<"Substitution2"<<"Substitution3"<<"Substitution4";
    if(possiblePosition.indexOf(position)>=0)
    {
        m_player_positions.insert(position,player);
    }
}

QString Team::getPosition(QString position)
{
    QString returnvalue;
    returnvalue=m_player_positions.value(position);
    return returnvalue;
}

