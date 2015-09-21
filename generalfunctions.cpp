#include "generalfunctions.h"

void spreadDates(QDate first, QDate last, int numRounds,int dec26)
{
    int dateDiff;
    int daysPerRound;
    int dayOfWeek;
//    int daysToDec26;
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
        if(dayOfWeek<6){
            next=first.addDays(6-dayOfWeek);
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
                dayOfWeek=next.dayOfWeek();
                dec26=0;
            }//else{
                next=next.addDays(7);
                roundDates.append(next);
            //}
        }
    }else{

    }
    for(int i=0;i<numRounds;i++){
        qDebug() << roundDates[i];
    }
}
