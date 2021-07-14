#ifndef DATASTORERD_H
#define DATASTORERD_H
#include <QList>
#include "dayrecord.h"

namespace DataStorerD {
    QList<DayRecord> readData();
    void storeData(QList<DayRecord> &notes);
};

#endif // DATASTORERD_H
