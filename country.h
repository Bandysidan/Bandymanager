#ifndef COUNTRY_H
#define COUNTRY_H

#include <QObject>
#include <QHash>

class Country : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString flag READ flag WRITE setFlag NOTIFY flagChanged)
    Q_PROPERTY(int league READ league WRITE setLeague NOTIFY leagueChanged)
public:
    explicit Country(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setFlag(QString value);
    QString flag();

    void setLeague(int value);
    int league();

    Q_INVOKABLE QString getFlagByUid(QString value);
    Q_INVOKABLE QString getNameByUid(QString value);
    Q_INVOKABLE QString getNextByUid(QString value,QString filter);

signals:
    void uidChanged();
    void nameChanged();
    void flagChanged();
    void leagueChanged();

public slots:

private slots:
    void onObjectNameChanged();

private:
    QString m_uid;
    QString m_name;
    QString m_flagname;
    int m_ownleague;

    static QHash<QString, Country *> *m_countries;
};

#endif // COUNTRY_H
