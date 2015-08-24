#ifndef TEAM_H
#define TEAM_H

#include <QObject>
#include <QHash>
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
//    Q_INVOKABLE QHash<QString,QString> getUidByCountryUid(QString value);

signals:
    void uidChanged();
    void nameChanged();
    void countryUidChanged();


public slots:

private:
      QString m_uid;
      QString m_name;
      QString m_country_uid;

      static QHash<QString, Team *> *m_teams;
      static QHash<QString, QString> *m_teams_by_country;
};

#endif // TEAM_H
