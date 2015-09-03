#include "game.h"

Game::Game(QObject *parent) :
    QObject(parent)
{
}

void Game::setUid(QString value)
{
    m_uid = value;
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
