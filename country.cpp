#include "country.h"

QList<Country *> *Country::m_countries;


Country::Country(QObject *parent) :
    QObject(parent)
{
    if(!m_countries)
        m_countries= new QList<Country *>();
    m_countries->push_front(this);
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
