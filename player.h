#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QHash>


class Player : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString countryUid READ countryUid WRITE setCountryUid NOTIFY countryUidChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)

public:
    explicit Player(QObject *parent = 0);


    void setUid(QString value);
    QString uid();

    void setFirstName(QString value);
    QString firstName();

    void setCountryUid(QString value);
    QString countryUid();

signals:
    void uidChanged();
    void firstNameChanged();
    void countryUidChanged();

public slots:


private slots:

private:
    QString m_uid;
    QString m_first_name;
    QString m_last_name;
    QString m_country_uid;


    static QHash<QString, Player *> *m_players;

};

#endif // PLAYER_H
