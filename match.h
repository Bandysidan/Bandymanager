#ifndef MATCH_H
#define MATCH_H

#include <QObject>
#include <QHash>
#include <QDebug>
#include <QDate>
#include "team.h"

class Match : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString homeTeamUid READ homeTeamUid WRITE setHomeTeamUid NOTIFY homeTeamUidChanged)
    Q_PROPERTY(QString awayTeamUid READ awayTeamUid WRITE setAwayTeamUid NOTIFY awayTeamUidChanged)
    Q_PROPERTY(int homeTeamScore READ homeTeamScore WRITE setHomeTeamScore NOTIFY homeTeamScoreChanged)
    Q_PROPERTY(int awayTeamScore READ awayTeamScore WRITE setAwayTeamScore NOTIFY awayTeamScoreChanged)
    Q_PROPERTY(int matchDay READ matchDay WRITE setMatchDay NOTIFY matchDayChanged)
    Q_PROPERTY(int matchMonth READ matchMonth WRITE setMatchMonth NOTIFY matchMonthChanged)
    Q_PROPERTY(int matchYear READ matchYear WRITE setMatchYear NOTIFY matchYearChanged)
public:
    explicit Match(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setHomeTeamUid(QString value);
    QString homeTeamUid();
    void setAwayTeamUid(QString value);
    QString awayTeamUid();

    void setMatchDay(int value);
    int matchDay();
    void setMatchMonth(int value);
    int matchMonth();
    void setMatchYear(int value);
    int matchYear();

    void setHomeTeamScore(int value);
    int homeTeamScore();
    void setAwayTeamScore(int value);
    int awayTeamScore();


    Q_INVOKABLE QString getHomeTeamUid(QString value);
    Q_INVOKABLE QString getAwayTeamUid(QString value);
    Q_INVOKABLE QString getUidByTeamUid(QString value);

    Q_INVOKABLE void matchInitiate(QString value);
    Q_INVOKABLE void matchTick(QString value,int min, int sec);

    Q_INVOKABLE QString getMatchDay(QString value);

    Q_INVOKABLE int getHomeResult(QString value);
    Q_INVOKABLE int getAwayResult(QString value);

signals:
    void uidChanged();
    void homeTeamUidChanged();
    void awayTeamUidChanged();
    void homeTeamScoreChanged();
    void awayTeamScoreChanged();
    void matchDayChanged();
    void matchMonthChanged();
    void matchYearChanged();


public slots:

private:
    QString m_uid;
    QString m_home_team_uid;
    QString m_away_team_uid;
    QHash<QString,QString> m_home_player_positions;
    QHash<QString,QString> m_away_player_positions;
    QHash<QString,int> m_home_player_skill;
    QHash<QString,int> m_away_player_skill;
    int m_match_day;
    int m_match_month;
    int m_match_year;
    int m_home_score;
    int m_away_score;
    //QHash<QString,QString> m_match_events;

    static QHash<QString, Match *> *m_matches;
    static QHash<QString,QString> *m_home_team;
    static QHash<QString,QString> *m_away_team;

};

#endif // MATCH_H
