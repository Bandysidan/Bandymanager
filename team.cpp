#include "team.h"

QHash<QString,Team *> *Team::m_teams;
QMultiHash<QString,QString> *Team::m_teams_by_country;

Team::Team(QObject *parent) :
    QObject(parent)
{
    if(!m_teams)
        m_teams= new QHash<QString,Team *>();
    if(!m_teams_by_country)
        m_teams_by_country = new QMultiHash<QString,QString>();

}

void Team::setUid(QString value)
{
    m_uid = value;
    m_teams->insert(m_uid, this);
    m_teams_by_country->insert(m_country_uid,m_uid);
 /*      int i;
         i=m_teams_by_country->count();
         qDebug()<<"setUid: "<< i << " "<< m_uid << " "<< m_country_uid;
         QList<QString> teamFilter = m_teams_by_country->values(m_country_uid);
         //QHash<QString> teamFilter = m_teams_by_country->find(m_uid);
         qDebug() << m_teams_by_country->count() << " "<< teamFilter.count();
         for (int j = 0; j < teamFilter.size(); ++j)
           qDebug() << j <<" "<<teamFilter.at(j) ;
*/

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
//    qDebug()<<"setCountryUid: "<< m_uid << " "<< m_country_uid;

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

QStringList Team::getUidByCountryUid(QString value)
{
    QStringList values = m_teams_by_country->values(value);
    values.sort();

    return values;

}

void Team::setPosition(QString value,QString position, QString player)
{
    Team *team = m_teams->value(value);

    QStringList possiblePosition;
    possiblePosition<<"Goalkeeper"<<"Defender1"<<"Defender2"<<"Defender3"<<"Defender4"<<"Defender5"<<"Midfielder1"<<"Midfielder2"<<"Midfielder3"<<"Attacker1"<<"Attacker2"<<"ReserveKeeper"<<"Substitution1"<<"Substitution2"<<"Substitution3"<<"Substitution4";
    if (team){
        if(possiblePosition.indexOf(position)>=0)
        {
            team->m_player_positions.insert(position,player);
        }
    }
    //qDebug() << value << " " << position << " "<< player;
}

QString Team::getPosition(QString value,QString position)
{
    Team *team = m_teams->value(value);
    QString returnvalue;
    if (team){
        returnvalue=team->m_player_positions.value(position);
    }else{
        returnvalue="error";
    }
    //qDebug() << value << " " << position << " " << returnvalue;
    return returnvalue;
}

void Team::autoPositions(QString value)
{
    Team *team = m_teams->value(value);
    Player *player;
    QStringList playerUids;

    if (team){
        playerUids=player->getPlayerUidsbyTeam(value);
        team->m_player_positions.insert("Goalkeeper",playerUids[0]);
        team->m_player_positions.insert("Defender1",playerUids[1]);
        team->m_player_positions.insert("Defender2",playerUids[2]);
        team->m_player_positions.insert("Defender3",playerUids[3]);
        team->m_player_positions.insert("Defender4",playerUids[4]);
        team->m_player_positions.insert("Defender5",playerUids[5]);
        team->m_player_positions.insert("Midfielder1",playerUids[6]);
        team->m_player_positions.insert("Midfielder2",playerUids[7]);
        team->m_player_positions.insert("Midfielder3",playerUids[8]);
        team->m_player_positions.insert("Attacker1",playerUids[9]);
        team->m_player_positions.insert("Attacker2",playerUids[10]);
        qDebug() << playerUids[10];
    }
}

void Team::fillTeams()
{
    int numPlayers;
//    Team *team;
    Player *player;
    Player *newPlayer;
    QHash<QString, Team *>::iterator i = m_teams->begin();
    while (i != m_teams->end()) {
//        team = m_teams->value(i.key());
        numPlayers= player->playersPerTeam(i.key());
//        qDebug() << i.key() << " " << player->playersPerTeam(i.key());
/*
        if(numPlayers==1){
            newPlayer=new Player();
            newPlayer->setFirstTeam(i.key());
            newPlayer->setUid(i.key());
            newPlayer->setFirstName("Testar");
            newPlayer->setFamilyName("Efternamn");
            qDebug() << i.key() << newPlayer->firstTeam();
            qDebug() << i.key() << " " << player->getFirstNameByUid(i.key());
//            newPlayer->setSkills();
        }
        */
        ++i;
    }
}
