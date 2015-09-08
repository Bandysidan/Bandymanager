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

void Team::setHomeShirt(QString value)
{
    m_home_shirt = value;
    emit homeShirtChanged();

}

QString Team::homeShirt()
{
    return m_home_shirt;
}

void Team::setRating(int value)
{
    m_rating =  value;
    emit ratingChanged();
}

int Team::rating()
{
    return m_rating;
}

QString Team::getNameByUid(QString value)
{
    Team *team = m_teams->value(value);
    if (team)
        return team->name();
    else
        return "error";
}

QString Team::getCountryByUid(QString value)
{
    Team *team = m_teams->value(value);
    if (team)
        return team->countryUid();
    else
        return "error";

}

QStringList Team::getUidByCountryUid(QString value)
{
    QStringList values = m_teams_by_country->values(value);
    values.sort();

    return values;

}

QString Team::getHomeShirtByUid(QString value)
{
    Team *team = m_teams->value(value);
    if (team)
        return team->homeShirt();
    else
        return "error";

}

int Team::getRating(QString value)
{
    Team *team = m_teams->value(value);
    if (team)
        return team->rating();
    else
        return -999;

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
        //qDebug() << playerUids[10];
    }
}

void Team::fillTeams()
{
//    qDebug() << "Test";
    int numPlayers;
    int numGoalkeeper;
    int numDefender;
    int numMidfielder;
    int numAttacker;
    int targetNumPlayers;
    int randomNumber;
    int playerType;
    int teamRating;
    int countryRating;
    int totalRating;
    Team *team;
    Country *country;
    Player *player;
    Player *newPlayer;
    QHash<QString, Team *>::iterator i = m_teams->begin();
    QList<int> skills;
    while (i != m_teams->end()) {
        team = m_teams->value(i.key());
        numPlayers= player->playersPerTeam(i.key());
        teamRating=team->rating();
        countryRating=country->getMaleSkill(team->countryUid());
        totalRating=teamRating*countryRating/1000;
//        qDebug() << i.key() << " " << player->playersPerTeam(i.key());
//        qDebug() << i.key() << " " << totalRating;

        if(numPlayers<=15){

            targetNumPlayers=rand()%6+15;
            for(int j=numPlayers;j<=targetNumPlayers;j++){
                newPlayer=new Player();
                newPlayer->setFirstTeam(i.key());
                newPlayer->setUid(i.key()+QString::number(j));
                newPlayer->setBirth(2015-19-rand()%15);
                randomNumber=rand()%400;
                if(randomNumber<280){
                    newPlayer->setCountryUid(team->getCountryByUid(i.key()));
                }else if(randomNumber<320){
                    newPlayer->setCountryUid("finland");
                }else if(randomNumber<330){
                    newPlayer->setCountryUid("norway");
                }else if(randomNumber<335){
                    newPlayer->setCountryUid("kazakhstan");
                }else if(randomNumber<340){
                    newPlayer->setCountryUid("usa");
                }else if(randomNumber<345){
                    newPlayer->setCountryUid("belarus");
                }else if(randomNumber<347){
                    newPlayer->setCountryUid("canada");
                }else if(randomNumber<349){
                    newPlayer->setCountryUid("estonia");
                }else if(randomNumber<350){
                    newPlayer->setCountryUid("hungary");
                }else if(randomNumber<352){
                    newPlayer->setCountryUid("japan");
                }else if(randomNumber<353){
                    newPlayer->setCountryUid("germany");
                }else if(randomNumber<354){
                    newPlayer->setCountryUid("holland");
                }else if(randomNumber<355){
                    newPlayer->setCountryUid("mongolia");
                }else if(randomNumber<356){
                    newPlayer->setCountryUid("china");
                }else if(randomNumber<357){
                    newPlayer->setCountryUid("czech");
                }else if(randomNumber<380){
                    newPlayer->setCountryUid("sweden");
                }else{
                    newPlayer->setCountryUid("russia");
                }
                newPlayer->setFirstName("?");
                newPlayer->setFamilyName("?");
                playerType=rand()%20;
                skills.clear();
                if(playerType<2){
                    skills.append(6*totalRating/100+rand()%(3*totalRating/100));
                    skills.append(6*totalRating/100+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(3*totalRating/100+rand()%(3*totalRating/100));
                }else if(playerType<4){
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((6*totalRating/100)+rand()%(3*totalRating/100));
                    skills.append((6*totalRating/100)+rand()%(3*totalRating/80));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/100)+rand()%(3*totalRating/80));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/100)+rand()%(6*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                }else if(playerType<7){
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                    skills.append((6*totalRating/100)+rand()%(3*totalRating/90));
                    skills.append((3*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((4*totalRating/120)+rand()%(6*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                }else if(playerType<10){
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((4*totalRating/100)+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(4*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(7*totalRating/200));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                }else if(playerType<15){
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append(1+rand()%(5*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((3*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append((9*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append((9*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append((3*totalRating/200)+rand()%(4*totalRating/100));
                    skills.append((7*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append((7*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                }else{
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((9*totalRating/200)+rand()%(3*totalRating/100));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((7*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append(1+rand()%(3*totalRating/100));
                    skills.append((7*totalRating/200)+rand()%(9*totalRating/200));
                    skills.append((4*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append((4*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append(1+rand()%(4*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(4*totalRating/100));
                    skills.append((5*totalRating/100)+rand()%(3*totalRating/100));
                }


    //            qDebug() << i.key() << newPlayer->firstTeam();
    //            qDebug() << i.key() << " " << player->getFirstNameByUid(i.key());
                newPlayer->setSkills(skills);
            }
        }

        ++i;
    }
}
