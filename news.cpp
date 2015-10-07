#include "news.h"

QHash<QString,News *> *News::m_news;

News::News(QObject *parent) :
    QObject(parent)
{
    if(!m_news)
        m_news= new QHash<QString,News *>();
}

void News::setUid(QString value)
{
    m_uid = value;
    emit uidChanged();
    m_news->insert(m_uid,this);
}

QString News::uid()
{
    return m_uid;
}

void News::setTitle(QString value)
{
    m_title = value;
    emit titleChanged();

}

QString News::title()
{
    return m_title;
}

void News::setText(QString value)
{
    m_text = value;
    emit textChanged();
}

QString News::text()
{
    return m_text;
}

void News::setDate(QDate value)
{
    m_date=value;
    emit dateChanged();
}

QDate News::date()
{
    return m_date;
}

void News::newNews(QString title, QString text, int year, int month, int day)
{
    News *newNews;
    newNews= new News;
    newNews->setDate(QDate(year,month,day));
    newNews->setTitle(title);
    newNews->setText(text);
    newNews->m_read=0;
    newNews->setUid(title);
}
