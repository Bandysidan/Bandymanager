#include "team.h"

QHash<QString,Team *> *Team::m_teams;
QHash<QString,QString> *Team::m_teams_by_country;

Team::Team(QObject *parent) :
    QObject(parent)
{
    if(!m_teams)
        m_teams= new QHash<QString,Team *>();

}

void Team::setUid(QString value)
{
    m_uid = value;
    m_teams->insert(m_uid, this);
    //m_teams_by_country->insert(m_uid,m_country_uid);
//    qDebug()<<"setUid: "<< m_uid << " "<< m_country_uid;
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
/*
QHash<Qstring,Qstring> Team::getUidByCountryUid(QString value)
{
//    QHash<Qstring,Qstring> teams = m_teams_by_country.value(value);
    QString key;
    foreach( key, m_teams_by_country.keys() )
      qDebug() << key << " = " << m_teams_by_country[key];


    //return teams;

}*/
