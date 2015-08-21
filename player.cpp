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

    m_first_name = value;

    emit firstNameChanged();
}

QString Player::firstName()
{
    return m_first_name;
}

void Player::setCountryUid(QString value)
{

    m_country_uid = value;
    //qDebug()<<"Testa: "<<m_first_name<< " "<< value;
    if(m_first_name=="")
    {
      // Country *country;
       //QString test_name=country->getNameByUid(value);
      // QString test_name=country->getMaleName(value);
        //m_first_name="Test"
        //qDebug()<<"Test ? "<<test_name;
    }

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
    //qDebug()<<m_players->keys();
    if (player)
        return player->firstName();
    else
        return "error";
}

QStringList Player::getPlayerUidsbyTeam(QString value)
{
  //return m_players;
}
