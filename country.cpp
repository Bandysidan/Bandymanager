#include "country.h"
#include <QDebug>

QHash<QString,Country *> *Country::m_countries;


Country::Country(QObject *parent) :
    QObject(parent)
{
    if(!m_countries)
        m_countries= new QHash<QString,Country *>();
}

void Country::setUid(QString value)
{
    m_uid = value;
    m_countries->insert(m_uid, this);
    emit uidChanged();
}

QString Country::uid()
{
     return m_uid;

}

void Country::setName(QString value)
{
    m_name = value;
    emit nameChanged();
}

QString Country::name()
{
    return m_name;
}

void Country::setFlag(QString value)
{
    m_flagname = value;
    emit flagChanged();

}

QString Country::flag()
{
    return m_flagname;
}

void Country::setLeague(int value)
{
    m_ownleague = value;
    emit leagueChanged();
}

int Country::league()
{
    return m_ownleague;
}

QString Country::getFlagByUid(QString value)
{
    Country *country = m_countries->value(value);
    if (country)
        return country->flag();
    else
        return "none.png";
}

QString Country::getNameByUid(QString value)
{
    Country *country = m_countries->value(value);
    if (country)
        return country->name();
    else
        return "error";
}

QString Country::getNextByUid(QString value, QString filter)
{
    Country *country = m_countries->value(value);
    if (country)
        return country->name();
    else
        return "error";

}


void Country::onObjectNameChanged()
{
     qDebug() << "name " << objectName();
}
