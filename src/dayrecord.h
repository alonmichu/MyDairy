#ifndef DAYRECORD_H
#define DAYRECORD_H

#include <QDate>
struct DayRecord
{
    DayRecord(QDate date, int index);
    QDate _date;
    int _index;
};


#endif // DAYRECORD_H
