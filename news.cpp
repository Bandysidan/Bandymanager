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
