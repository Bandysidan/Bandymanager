#ifndef GENERALFUNCTIONS_H
#define GENERALFUNCTIONS_H

#include <QDate>
#include <QDebug>
#include <QList>

QList<QDate> spreadDates(QDate first, QDate last, int numRounds, int dec26,int weekend);

#endif // GENERALFUNCTIONS_H
