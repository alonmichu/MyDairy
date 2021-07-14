#ifndef TRAININGRECORDLIST_H
#define TRAININGRECORDLIST_H
#include <QAbstractListModel>
#include <QList>
#include <QString>
#include "trainingrecord.h"


class TrainingRecordList: public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TrainingRecordList(QObject *parent=nullptr);

    // Note list
    enum TrainingRecordRoles {
        DayindexRole = Qt::UserRole + 1,
        TextRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_notes.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addTrainingRecord(int dayindex, QString text);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    QList<TrainingRecord> m_notes;
};
#endif // TRAININGRECORDLIST_H
