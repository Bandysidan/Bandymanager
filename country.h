#ifndef COUNTRY_H
#define COUNTRY_H

#include <QObject>
#include <QList>

class Country : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString flag READ flag WRITE setFlag NOTIFY flagChanged)
    Q_PROPERTY(int league READ league WRITE setLeague NOTIFY leagueChanged)
public:
    explicit Country(QObject *parent = 0);

    void setName(QString value);
    QString name();

    void setFlag(QString value);
    QString flag();

    void setLeague(int value);
    int league();
signals:
    void nameChanged();
    void flagChanged();
    void leagueChanged();

public slots:

private:
    QString m_name;
    QString m_flagname;
    int m_ownleague;

    static QList<Country *> *m_countries;
};

#endif // COUNTRY_H
