#include "dayrecordlist.h"
#include "datastorerd.h"
#include <QVariant>
#include <QDebug>

DayRecordList::DayRecordList(QObject* parent) : QAbstractListModel(parent), m_notes()
{

}

QHash<int, QByteArray> DayRecordList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[DateRole] = "date";
    roles[IndexRole] = "index";
    return roles;
}

QVariant DayRecordList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case DateRole:
        return QVariant(m_notes[index.row()]._date);
    case IndexRole:
        return QVariant(m_notes[index.row()]._index);
    default:
        return QVariant();
    }
}

void DayRecordList::addDayRecord(QDate date, int index) {
    auto notesSize = m_notes.size();
    beginInsertRows(QModelIndex(), notesSize, notesSize);
    m_notes.append(DayRecord(date, index));
    endInsertRows();
}

void DayRecordList::readList() {
    beginResetModel();
    m_notes = DataStorerD::readData();
    endResetModel();
}

void DayRecordList::storeList() {
    DataStorerD::storeData(m_notes);
}
