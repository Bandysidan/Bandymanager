#ifndef MATCH_H
#define MATCH_H

#include <QObject>
#include <QHash>
#include <QDebug>

class Match : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString homeTeamUid READ homeTeamUid WRITE setHomeTeamUid NOTIFY homeTeamUidChanged)
    Q_PROPERTY(QString awayTeamUid READ awayTeamUid WRITE setAwayTeamUid NOTIFY awayTeamUidChanged)
public:
    explicit Match(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setHomeTeamUid(QString value);
    QString homeTeamUid();
    void setAwayTeamUid(QString value);
    QString awayTeamUid();

    Q_INVOKABLE QString getHomeTeamUid(QString value);
    Q_INVOKABLE QString getAwayTeamUid(QString value);
signals:
    void uidChanged();
    void homeTeamUidChanged();
    void awayTeamUidChanged();

public slots:

private:
    QString m_uid;
    QString m_home_team_uid;
    QString m_away_team_uid;
    int m_home_score;
    int m_away_score;
    //QHash<QString,QString> m_match_events;

    static QHash<QString, Match *> *m_matches;

};

#endif // MATCH_H
