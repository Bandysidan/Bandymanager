#include "generalfunctions.h"

QList<QDate> spreadDates(QDate first, QDate last, int numRounds,int dec26,int weekend)
{
    int dateDiff;
    int daysPerRound;
    int dayOfWeek;
    int year;
    QDate next;
    QDate december26;
    QList<QDate> roundDates;
    dateDiff=first.daysTo(last);
    year=first.year();
    december26=QDate(year,12,26);
    daysPerRound=dateDiff/numRounds;
    qDebug()<< dateDiff << " "<< daysPerRound;
    if(daysPerRound>=7){
        dayOfWeek=first.dayOfWeek();
        if(dayOfWeek<weekend){
            next=first.addDays(weekend-dayOfWeek);
        }else{
            next=first;
        }
        roundDates.append(next);
        for(int i=2;i<=numRounds;i++){
            if(dec26==1 && next.daysTo(december26)<10){
                next=december26;
                roundDates.append(next);
                dec26=2;
            } else if(dec26==2) {
                next=next.addDays(3);

                dayOfWeek=next.dayOfWeek();
                dec26=0;
                if(dayOfWeek<weekend){
                    next=next.addDays(weekend-dayOfWeek);
                }
                roundDates.append(next);
            }else{
                next=next.addDays(7);
                roundDates.append(next);
            }
        }
    }else{

    }
    //qDebug() << roundDates.count();
    for(int i=0;i<numRounds;i++){
        qDebug() << i << roundDates[i] << roundDates[i].dayOfWeek();
    }
    return roundDates;
}
