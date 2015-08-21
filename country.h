#ifndef COUNTRY_H
#define COUNTRY_H

#include <QObject>
#include <QHash>
#include <QList>
#include <QStringList>
#include <QVariant>
#include <algorithm>


class Country : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString flag READ flag WRITE setFlag NOTIFY flagChanged)
    Q_PROPERTY(QVariant malename READ malename WRITE setMalenames NOTIFY malenameChanged)
    Q_PROPERTY(QVariant familyname READ familyname WRITE setFamilynames NOTIFY familynameChanged)
    Q_PROPERTY(int league READ league WRITE setLeague NOTIFY leagueChanged)
    Q_PROPERTY(int maleNational READ maleNational WRITE setMaleNational NOTIFY maleChanged)
    Q_PROPERTY(int femaleNational READ femaleNational WRITE setFemaleNational NOTIFY femaleChanged)
    Q_PROPERTY(int memberNation READ memberNation WRITE setMemberNation NOTIFY memberChanged)
    Q_PROPERTY(int maleSkill READ maleSkill WRITE setMaleSkill NOTIFY maleSkillChanged)
    Q_PROPERTY(int femaleSkill READ femaleSkill WRITE setFemaleSkill NOTIFY femaleSkillChanged)
public:
    explicit Country(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setName(QString value);
    QString name();

    void setMalenames(QVariant value);
    QVariant malename();

    void setFamilynames(QVariant value);
    QVariant familyname();

    void setFlag(QString value);
    QString flag();

    void setLeague(int value);
    int league();

    void setMaleNational(int value);
    int maleNational();

    void setFemaleNational(int value);
    int femaleNational();

    void setMemberNation(int value);
    int memberNation();

    void setMaleSkill(int value);
    int maleSkill();

    void setFemaleSkill(int value);
    int femaleSkill();

    Q_INVOKABLE QString getFlagByUid(QString value);
    Q_INVOKABLE QString getNameByUid(QString value);
    Q_INVOKABLE void setMaleName(QString value,QString cvalue);
    Q_INVOKABLE QString getMaleName(QString value);
    Q_INVOKABLE QString getFamilyName(QString value);
//    Q_INVOKABLE QString getNextByUid(QString value,QString filter);

signals:
    void uidChanged();
    void nameChanged();
    void flagChanged();
    void malenameChanged();
    void familynameChanged();
    void leagueChanged();
    void maleChanged();
    void femaleChanged();
    void memberChanged();
    void maleSkillChanged();
    void femaleSkillChanged();

public slots:

private slots:
    void onObjectNameChanged();

private:
    QString m_uid;
    QString m_name;
    QString m_flagname;
    int m_ownleague;
    int m_male_national;
    int m_female_national;
    int m_member;
    int m_male_skill;
    int m_female_skill;

    QStringList m_male_name;
    QStringList m_family_name;

    static QHash<QString, Country *> *m_countries;

};

#endif // COUNTRY_H
