#include "trainingrecordlist.h"
#include "datastorert.h"
#include <QVariant>
#include <QDebug>

TrainingRecordList::TrainingRecordList(QObject* parent) : QAbstractListModel(parent), m_notes()
{

}

QHash<int, QByteArray> TrainingRecordList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[DayindexRole] = "dayindex";
    roles[TextRole] = "text";
    return roles;
}

QVariant TrainingRecordList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case DayindexRole:
        return QVariant(m_notes[index.row()]._dayindex);
    case TextRole:
        return QVariant(m_notes[index.row()]._text);
    default:
        return QVariant();
    }
}

void TrainingRecordList::addTrainingRecord(int dayindex, QString text) {
    auto notesSize = m_notes.size();
    beginInsertRows(QModelIndex(), notesSize, notesSize);
    m_notes.append(TrainingRecord(dayindex, text));
    endInsertRows();
}

void TrainingRecordList::readList() {
    beginResetModel();
    m_notes = DataStorerT::readData();
    endResetModel();
}

void TrainingRecordList::storeList() {
    DataStorerT::storeData(m_notes);
}

