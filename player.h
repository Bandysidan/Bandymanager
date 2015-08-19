#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QHash>
#include <QDebug>
#include "country.h"


class Player : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString firstTeam READ firstTeam WRITE setFirstTeam NOTIFY firstTeamChanged)
public:
    explicit Player(QObject *parent = 0);


    void setUid(QString value);
    QString uid();

    void setFirstName(QString value);
    QString firstName();

    void setCountryUid(QString value);
    QString countryUid();

    void setFirstTeam(QString value);
    QString firstTeam();

    Q_INVOKABLE QString getFirstNameByUid(QString value);
signals:
    void uidChanged();
    void firstNameChanged();
    void countryUidChanged();
    void firstTeamChanged();

public slots:


private slots:

private:
    QString m_uid;
    QString m_first_name;
    QString m_last_name;
    QString m_country_uid;
    QString m_first_team;


    static QHash<QString, Player *> *m_players;

};

#endif // PLAYER_H
