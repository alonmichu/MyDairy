#ifndef DATASTORERW_H
#define DATASTORERW_H
#include <QList>
#include <QString>
#include "weightrecord.h"

namespace DataStorerW
{
    QList<WeightRecord> readData();
    void storeData(QList<WeightRecord> &notes);
};


#endif // DATASTORERW_H
