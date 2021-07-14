#ifndef DATASTORERT_H
#define DATASTORERT_H

#include <QString>
#include <QList>
#include "trainingrecord.h"

namespace DataStorerT {
    QList<TrainingRecord> readData();
    void storeData(QList<TrainingRecord> &notes);
};
#endif // DATASTORERT_H
