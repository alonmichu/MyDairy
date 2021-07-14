#ifndef WEIGHTRECORD_H
#define WEIGHTRECORD_H

#include <QString>
#include <QDate>
struct WeightRecord
{
    WeightRecord(QDate date, int weight);
    QDate _date;
    int _weight;
};
#endif // WEIGHTRECORD_H
