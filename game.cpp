#include "game.h"

QHash<QString,Game *> *Game::m_game;

Game::Game(QObject *parent) :
    QObject(parent)
{
    if(!m_game)
        m_game= new QHash<QString,Game *>();
}

void Game::setUid(QString value)
{
    m_uid = value;
    m_game->insert(m_uid,this);
    m_today=QDate(m_year,m_month,m_day);
    emit uidChanged();
}

QString Game::uid()
{
    return m_uid;
}

void Game::setDay(int value)
{
    m_day = value;
    emit dayChanged();
}

int Game::day()
{
    return m_day;
}

void Game::setMonth(int value)
{
    m_month = value;
    emit monthChanged();
}

int Game::month()
{
    return m_month;
}

void Game::setYear(int value)
{
    m_year = value;
    emit yearChanged();
}

int Game::year()
{
    return m_year;
}

QDate Game::today()
{
    return m_today;
}

QString Game::getShortDate()
{
    Game *game =m_game->value("mainGame");
    QString shortDateString;
    shortDateString=game->today().toString("yyyy-MM-dd");
    return shortDateString;
}
