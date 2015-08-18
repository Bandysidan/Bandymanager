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
    emit uidChanged();

}

QString Player::countryUid()
{
return m_country_uid;
}
