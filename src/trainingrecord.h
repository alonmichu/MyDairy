#ifndef TRAININGRECORD_H
#define TRAININGRECORD_H

#include<QString>

struct TrainingRecord
{
    TrainingRecord(int dayindex, QString text);
    int _dayindex;
    QString _text;
    //QString _filepath;//How to storage text? Path fits, oder?
};

#endif // TRAININGRECORD_H
