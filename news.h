#ifndef NEWS_H
#define NEWS_H

#include <QObject>
#include <QDate>

class News : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

public:
    explicit News(QObject *parent = 0);

    void setUid(QString value);
    QString uid();

    void setTitle(QString value);
    QString title();

    void setText(QString value);
    QString text();

signals:
    void uidChanged();
    void titleChanged();
    void textChanged();

public slots:

private:
    QString m_uid;
    QString m_title;
    QString m_text;
    QDate m_date;
    int m_read;

    static QHash<QString, News *> *m_news;

};

#endif // NEWS_H
