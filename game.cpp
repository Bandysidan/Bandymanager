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
