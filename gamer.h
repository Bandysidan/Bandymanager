#ifndef GAMER_H
#define GAMER_H

#include <QObject>
#include <QHash>

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

    Q_INVOKABLE void setNameStart(QString value,QString gamer);
    Q_INVOKABLE QString getName(QString gamer);
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
    static QHash<QString, QString> *m_gamernames;

};


#endif // GAMER_H
