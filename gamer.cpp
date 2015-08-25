#include "gamer.h"

QHash<QString,Gamer *> *Gamer::m_gamers;

Gamer::Gamer(QObject *parent) :
    QObject(parent)
{
    if(!m_gamers)
        m_gamers= new QHash<QString,Gamer *>();


}

void Gamer::setUid(QString value)
{
        m_uid = value;
            m_gamers->insert(m_uid, this);
        emit uidChanged();
}

QString Gamer::uid()
{
     return m_uid;
}

void Gamer::setName(QString value)
{
    m_name = value;
   // qDebug() << m_name;
    emit nameChanged();
}

QString Gamer::name()
{
    return m_name;
}

void Gamer::setTeamUid(QString value)
{
    m_team_uid = value;
    emit teamUidChanged();
}

QString Gamer::teamUid()
{
    return m_team_uid;
}

void Gamer::setNameStart(QString value, QString gamertype)
{
    Gamer *gamer = m_gamers->value(gamertype);
    if(gamer)
    {
        gamer->setName(value);

    }
}

QString Gamer::getName(QString value)
{
    Gamer *gamer = m_gamers->value(value);
    if (gamer)
    {
      //  qDebug() << "Test" << gamer->uid();
        return gamer->name();
    }
    else
        return "error";

}

void Gamer::setTeamUidStart(QString value, QString gamertype)
{
    Gamer *gamer = m_gamers->value(gamertype);
    if(gamer)
    {
        gamer->setTeamUid(value);

    }


}

QString Gamer::getTeamUid(QString value)
{
    Gamer *gamer = m_gamers->value(value);
    if (gamer)
    {
       // qDebug() << "Test" << gamer->uid();
        return gamer->teamUid();
    }
    else
        return "error";
}
