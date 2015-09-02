#ifndef GAME_H
#define GAME_H

#include <QObject>

class Game : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)

public:
    explicit Game(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

signals:
    void uidChanged();

public slots:

private:
    QString m_uid;
    int m_day;
    int m_month;
    int m_year;


};

#endif // GAME_H
