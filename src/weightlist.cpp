#include <QDebug>
#include <QVariant>
#include "weightlist.h"
#include "datastorerw.h"

WeightRecordList::WeightRecordList(QObject* parent) : QAbstractListModel(parent), m_notes()
{

}

QHash<int, QByteArray> WeightRecordList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[DateRole] = "date";
    roles[WeightRole] = "weight";
    return roles;
}

QVariant WeightRecordList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case DateRole:
        return QVariant(m_notes[index.row()]._date);
    case WeightRole:
        return QVariant(m_notes[index.row()]._weight);
    default:
        return QVariant();
    }
}

void WeightRecordList::addWeightRecord(QDate date, int weight) {
    auto notesSize = m_notes.size();
    beginInsertRows(QModelIndex(), notesSize, notesSize);
    m_notes.append(WeightRecord(date, weight));
    endInsertRows();
}

void WeightRecordList::readList() {
    beginResetModel();
    m_notes = DataStorerW::readData();
    endResetModel();
}

void WeightRecordList::storeList() {
    DataStorerW::storeData(m_notes);
}
void WeightRecordList::updateRecord(int indx, QDate date, int weight){
    m_notes[indx]._date=date;
    m_notes[indx]._weight=weight;
}
int WeightRecordList::findRecord(QDate date){
    for (int i=0;i<m_notes.size();i++){
        if (m_notes[i]._date==date) return i;
    }
    return -1;
}
