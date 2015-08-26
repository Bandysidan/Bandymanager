#ifndef TEAM_H
#define TEAM_H

#include <QObject>
#include <QHash>
#include <QMultiHash>
#include <QList>
#include <QStringList>
#include <QString>
#include <QDebug>

class Team : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)

public:
    explicit Team(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setCountryUid(QString value);
    QString countryUid();

    Q_INVOKABLE QString getNameByUid(QString value);
    Q_INVOKABLE QStringList getUidByCountryUid(QString value);

    Q_INVOKABLE void setPosition(QString position,QString player);
    Q_INVOKABLE QString getPosition(QString position);

signals:
    void uidChanged();
    void nameChanged();
    void countryUidChanged();


public slots:

private:
    QString m_uid;
    QString m_name;
    QString m_country_uid;
    QHash<QString,QString> m_player_positions;

    static QHash<QString, Team *> *m_teams;
    static QMultiHash<QString, QString> *m_teams_by_country;
};

#endif // TEAM_H
