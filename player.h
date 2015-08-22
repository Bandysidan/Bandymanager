#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QHash>
#include <QStringList>
#include <QDebug>
#include "country.h"


class Player : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString familyName READ familyName WRITE setFamilyName NOTIFY familyNameChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString firstTeam READ firstTeam WRITE setFirstTeam NOTIFY firstTeamChanged)
    Q_PROPERTY(QList<int> skills READ skills WRITE setSkills NOTIFY skillsChanged)
public:
    explicit Player(QObject *parent = 0);


    void setUid(QString value);
    QString uid();

    void setFirstName(QString value);
    QString firstName();

    void setFamilyName(QString value);
    QString familyName();

    void setCountryUid(QString value);
    QString countryUid();

    void setFirstTeam(QString value);
    QString firstTeam();

    void setSkills(QList<int> value);
    QList<int> skills();


    Q_INVOKABLE QString getFirstNameByUid(QString value);
    Q_INVOKABLE QString getFamilyNameByUid(QString value);
    Q_INVOKABLE QString getFullNameByUid(QString value);
    Q_INVOKABLE QString getShortNameByUid(QString value);
    Q_INVOKABLE QString getCountryByUid(QString value);
    Q_INVOKABLE QList<int> getSkillsByUid(QString value);

  //  Q_INVOKABLE QStringList getPlayerUidsbyTeam(QString value);
signals:
    void uidChanged();
    void firstNameChanged();
    void familyNameChanged();
    void countryUidChanged();
    void firstTeamChanged();
    void skillsChanged();

public slots:


private slots:

private:
    QString m_uid;
    QString m_first_name;
    QString m_family_name;
    QString m_last_name;
    QString m_country_uid;
    QString m_first_team;

    QList<int> m_skills;


    static QHash<QString, Player *> *m_players;

};

#endif // PLAYER_H
