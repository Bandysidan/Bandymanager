#include "team.h"

QHash<QString,Team *> *Team::m_teams;

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
