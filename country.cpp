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

void Country::setMalename(QVariant value)
{
 /*   m_male_name.clear();
    foreach (QVariant item, value.toList()) {
                    m_male_name.append(item);
                }

    emit malenameChanged();*/
}

QString Country::malename()
{
    std::random_shuffle(m_male_name.begin(), m_male_name.end());
    return m_male_name.takeFirst();
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

void Country::setMaleNational(int value)
{
    m_male_national = value;
    emit maleChanged();
}

int Country::maleNational()
{
    return m_male_national;
}


void Country::setFemaleNational(int value)
{
    m_female_national = value;
    emit femaleChanged();
}

int Country::femaleNational()
{
    return m_female_national;
}

void Country::setMemberNation(int value)
{
    m_member = value;
    emit memberChanged();
}

int Country::memberNation()
{
    return m_member;
}

void Country::setMaleSkill(int value)
{
    m_male_skill = value;
    emit maleSkillChanged();
}

int Country::maleSkill()
{
    return m_male_skill;
}

void Country::setFemaleSkill(int value)
{
    m_female_skill = value;
    emit femaleSkillChanged();
}

int Country::femaleSkill()
{
    return m_female_skill;
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
