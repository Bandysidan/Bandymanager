#include "player.h"

QHash<QString,Player *> *Player::m_players;


Player::Player(QObject *parent) :
    QObject(parent)
{
    if(!m_players)
        m_players= new QHash<QString,Player *>();
}

void Player::setUid(QString value)
{
    m_uid = value;
    m_players->insert(m_uid, this);
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

void Player::setCountryUid(QString value)
{

//    m_country_uid = value;
    Country *country;
//    QString name=country->getMaleName(value);
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



QStringList Player::getPlayerUidsbyTeam(QString value)
{
  //return m_players;
}
