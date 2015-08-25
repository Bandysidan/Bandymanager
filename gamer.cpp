#include "gamer.h"

QHash<QString,Gamer *> *Gamer::m_gamers;
QHash<QString,QString> *Gamer::m_gamernames;

Gamer::Gamer(QObject *parent) :
    QObject(parent)
{
    if(!m_gamers)
        m_gamers= new QHash<QString,Gamer *>();
    if(!m_gamernames)
        m_gamernames= new QHash<QString,QString>();


}

void Gamer::setUid(QString value)
{
        m_uid = value;
        emit uidChanged();
}

QString Gamer::uid()
{
     return m_uid;
}

void Gamer::setName(QString value)
{
    m_name = value;
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

void Gamer::setNameStart(QString value, QString gamer)
{
    m_gamernames->insert(gamer,value);

    emit nameChanged();
}

QString Gamer::getName(QString value)
{
    Gamer *gamer = m_gamers->value(value);
    if (gamer)
        return gamer->name();
    else
        return "error";

}
