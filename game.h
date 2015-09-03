#ifndef GAME_H
#define GAME_H

#include <QObject>

class Game : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(int day READ day WRITE setDay NOTIFY dayChanged)
    Q_PROPERTY(int month READ month WRITE setMonth NOTIFY monthChanged)
    Q_PROPERTY(int year READ year WRITE setYear NOTIFY yearChanged)

public:
    explicit Game(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setDay(int value);
    int day();
    void setMonth(int value);
    int month();
    void setYear(int value);
    int year();

signals:
    void uidChanged();
    void dayChanged();
    void monthChanged();
    void yearChanged();

public slots:

private:
    QString m_uid;
    int m_day;
    int m_month;
    int m_year;


};

#endif // GAME_H
