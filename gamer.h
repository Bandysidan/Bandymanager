#ifndef GAMER_H
#define GAMER_H

#include <QObject>
#include <QHash>
#include <QDebug>

class Gamer : public QObject
{
    Q_OBJECT


    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString teamUid READ teamUid WRITE setTeamUid NOTIFY teamUidChanged)
public:
    explicit Gamer(QObject *parent = 0);


    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setTeamUid(QString value);
    QString teamUid();

    Q_INVOKABLE void setNameStart(QString value,QString gamertype);
    Q_INVOKABLE QString getName(QString value);
    Q_INVOKABLE void setTeamUidStart(QString value,QString gamertype);
    Q_INVOKABLE QString getTeamUid(QString value);

signals:
    void uidChanged();
    void nameChanged();
    void teamUidChanged();

public slots:

private:
    QString m_uid;
    QString m_name;
    QString m_team_uid;

    static QHash<QString, Gamer *> *m_gamers;

};


#endif // GAMER_H
