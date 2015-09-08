#ifndef TEAM_H
#define TEAM_H

#include <QObject>
#include <QHash>
#include <QMultiHash>
#include <QList>
#include <QStringList>
#include <QString>
#include <QDebug>
#include "player.h"
class Team : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)
    Q_PROPERTY(QString homeShirt READ homeShirt WRITE setHomeShirt NOTIFY homeShirtChanged)
    Q_PROPERTY(int rating READ rating WRITE setRating NOTIFY ratingChanged)

public:
    explicit Team(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setCountryUid(QString value);
    QString countryUid();

    void setHomeShirt(QString value);
    QString homeShirt();

    void setRating(int value);
    int rating();


    Q_INVOKABLE QString getNameByUid(QString value);
    Q_INVOKABLE QString getCountryByUid(QString value);
    Q_INVOKABLE QStringList getUidByCountryUid(QString value);

    Q_INVOKABLE QString getHomeShirtByUid(QString value);

    Q_INVOKABLE int getRating(QString value);

    Q_INVOKABLE void setPosition(QString value,QString position,QString player);
    Q_INVOKABLE QString getPosition(QString value,QString position);
    Q_INVOKABLE void autoPositions(QString value);
    
    Q_INVOKABLE void fillTeams();

signals:
    void uidChanged();
    void nameChanged();
    void countryUidChanged();
    void homeShirtChanged();
    void ratingChanged();

public slots:

private:
    QString m_uid;
    QString m_name;
    QString m_country_uid;
    QString m_home_shirt;
    QString m_away_shirt;
    int m_rating;
    QHash<QString,QString> m_player_positions;


    static QHash<QString, Team *> *m_teams;
    static QMultiHash<QString, QString> *m_teams_by_country;
};

#endif // TEAM_H
