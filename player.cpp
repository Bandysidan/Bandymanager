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
    QString seed;
    int random;
    random=rand()%10000;
    seed=QString::number(random);
    m_uid = value; //+seed;
    m_players->insert(m_uid, this);
    m_first_team_uid->insert(m_first_team,value);
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

int Player::playersPerTeam(QString value)
{
    QStringList values = m_first_team_uid->values(value);
    return values.count();

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

QList<int> Player::getPositionSkills(QString value)
{
    //qDebug() << "getPositionSkills(Value): "<<value;
    Player *player = m_players->value(value);
    QList<int> skills;
    skills=player->skills();
    QList<int> positionSkills;

    if (player){
        positionSkills.append((skills[0]*65+skills[1]*30+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[3]*30+skills[4]*20+skills[5]*15+skills[9]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[3]*35+skills[4]*20+skills[5]*10+skills[9]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*19+skills[3]*18+skills[4]*20+skills[5]*12+skills[7]*5+skills[8]*5+skills[9]*5+skills[10]*3+skills[11]*3+skills[12]*10)/100);
        positionSkills.append((skills[2]*25+skills[4]*20+skills[6]*5+skills[7]*10+skills[8]*10+skills[9]*5+skills[10]*10+skills[11]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[4]*10+skills[6]*11+skills[7]*12+skills[8]*12+skills[10]*15+skills[11]*15+skills[12]*5)/100);
    }
    else
        positionSkills.append(-1);
    return positionSkills;
}

QString Player::getBestPosition(QString value)
{
    Player *player = m_players->value(value);
    QList<int> skills;
    int bestSkillnumber;
    skills=player->skills();
    QList<int> positionSkills;
    QString bestPosition;

    if (player){
        positionSkills.append((skills[0]*65+skills[1]*30+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[3]*30+skills[4]*20+skills[5]*15+skills[9]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[3]*35+skills[4]*20+skills[5]*10+skills[9]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*19+skills[3]*18+skills[4]*20+skills[5]*12+skills[7]*5+skills[8]*5+skills[9]*5+skills[10]*3+skills[11]*3+skills[12]*10)/100);
        positionSkills.append((skills[2]*25+skills[4]*20+skills[6]*5+skills[7]*10+skills[8]*10+skills[9]*5+skills[10]*10+skills[11]*10+skills[12]*5)/100);
        positionSkills.append((skills[2]*20+skills[4]*10+skills[6]*11+skills[7]*12+skills[8]*12+skills[10]*15+skills[11]*15+skills[12]*5)/100);
        bestPosition="Målvakt"; bestSkillnumber=positionSkills[0];
        if (positionSkills[1]>bestSkillnumber) {
            bestPosition="Libero"; bestSkillnumber=positionSkills[1];
        }
        if (positionSkills[2]>bestSkillnumber) {
            bestPosition="Back"; bestSkillnumber=positionSkills[2];
        }
        if (positionSkills[3]>bestSkillnumber) {
            bestPosition="Halv"; bestSkillnumber=positionSkills[3];
        }
        if (positionSkills[4]>bestSkillnumber) {
            bestPosition="Mittfältare"; bestSkillnumber=positionSkills[4];
        }
        if (positionSkills[5]>bestSkillnumber) {
            bestPosition="Anfallare";
        }
    }
    else
        bestPosition="error";
    return bestPosition;

}



QStringList Player::getPlayerUidsbyTeam(QString value)
{
    QStringList values = m_first_team_uid->values(value);
    return values;
}
