#ifndef SERIE_H
#define SERIE_H

#include <QObject>
#include <QHash>
#include <QMultiHash>
#include <QList>
#include <QStringList>
#include <QDebug>
#include "match.h"

class Serie : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)
    Q_PROPERTY(QStringList teamUid READ teamUid WRITE setTeamUid NOTIFY teamUidChanged)
    Q_PROPERTY(QStringList matchUid READ matchUid WRITE setMatchUid NOTIFY matchUidChanged)
public:
    explicit Serie(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setCountryUid(QString value);
    QString countryUid();

    void setTeamUid(QStringList value);
    QStringList teamUid();

    void setMatchUid(QStringList value);
    QStringList matchUid();


    Q_INVOKABLE QString getNameByUid(QString value);
    Q_INVOKABLE QStringList getTeamsByUid(QString value);
    Q_INVOKABLE QStringList getMatchesByUid(QString value);

    Q_INVOKABLE QStringList getUidByCountryUid(QString value);
    Q_INVOKABLE QStringList getAllUid();
    Q_INVOKABLE void makeSchedule(QString value);

signals:
    void uidChanged();
    void nameChanged();
    void countryUidChanged();
    void teamUidChanged();
    void matchUidChanged();

public slots:

private:
    QString m_uid;
    QString m_name;
    QString m_country_uid;
    QStringList m_team_list;
    QStringList m_match_list;

    static QHash<QString, Serie *> *m_series;
    static QMultiHash<QString, QString> *m_series_by_country;

};

#endif // SERIE_H
