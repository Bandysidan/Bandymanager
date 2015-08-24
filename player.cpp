#include "player.h"

QHash<QString,Player *> *Player::m_players;
QMultiHash<QString,QString> *Player::m_first_team_uid;

Player::Player(QObject *parent) :
    QObject(parent)
{
    if(!m_players)
        m_players= new QHash<QString,Player *>();
    if(!m_first_team_uid)
        m_first_team_uid= new QMultiHash<QString,QString>();
}

void Player::setUid(QString value)
{
    m_uid = value;
    m_players->insert(m_uid, this);
    m_first_team_uid->insert(m_first_team,m_uid);
    //int i;

    //qDebug()<<"setUid: "<< " "<< m_uid << " "<< m_first_team;
    emit uidChanged();

}

QString Player::uid()
{
    return m_uid;
}

void Player::setFirstName(QString value)
{
    if(value!="?")
        m_first_name = value;

    emit firstNameChanged();
}

QString Player::firstName()
{
    return m_first_name;
}

void Player::setFamilyName(QString value)
{

    if(value!="?")
        m_family_name = value;

    emit familyNameChanged();
}

QString Player::familyName()
{
    return m_family_name;
}

void Player::setBirth(int value)
{
    m_birthyear=value;

emit familyNameChanged();

}

int Player::birth()
{
    return m_birthyear;
}

void Player::setCountryUid(QString value)
{

    m_country_uid = value;
    Country *country;
    m_first_name=country->getMaleName(value);
    m_family_name=country->getFamilyName(value);

    emit countryUidChanged();

}

QString Player::countryUid()
{
    return m_country_uid;
}

void Player::setFirstTeam(QString value)
{
    m_first_team = value;
    emit firstTeamChanged();

}

QString Player::firstTeam()
{
    return m_first_team;
}

void Player::setSkills(QList<int> value)
{
    m_skills=value;
    emit skillsChanged();
}

QList<int> Player::skills()
{
    return m_skills;
}

QString Player::getFirstNameByUid(QString value)
{
    Player *player = m_players->value(value);
    if (player)
        return player->firstName();
    else
        return "error";
}

QString Player::getFamilyNameByUid(QString value)
{
    Player *player = m_players->value(value);
    if (player)
        return player->familyName();
    else
        return "error";
}

QString Player::getFullNameByUid(QString value)
{
    Player *player = m_players->value(value);
    QString playername = player->firstName() +" "+ player->familyName();
    if (player)
        return playername;
    else
        return "error";
}

QString Player::getShortNameByUid(QString value)
{
    Player *player = m_players->value(value);

    QString playername = player->firstName().left(1) +". "+ player->familyName();
    if (player)
        return playername;
    else
        return "error";
}

int Player::getBirthyearByUid(QString value)
{
    Player *player = m_players->value(value);
    if (player)
        return player->birth();
    else
        return -999;

}

QString Player::getCountryByUid(QString value)
{
    Player *player = m_players->value(value);
    if (player)
        return player->countryUid();
    else
        return "error";
}

QList<int> Player::getSkillsByUid(QString value)
{
    Player *player = m_players->value(value);
    QList<int> errorreturn;
    errorreturn.append(-1);
    if (player)
        return player->skills();
    else
        return errorreturn;

}



QStringList Player::getPlayerUidsbyTeam(QString value)
{
    QStringList values = m_first_team_uid->values(value);
    return values;
}
