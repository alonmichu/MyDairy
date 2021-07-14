#ifndef WEIGHTLIST_H
#define WEIGHTLIST_H

#include <QAbstractListModel>
#include <QList>
#include "weightrecord.h"


class WeightRecordList: public QAbstractListModel
{
    Q_OBJECT
public:
    explicit WeightRecordList(QObject *parent=nullptr);

    // Note list
    enum WeightRecordRoles {
        DateRole = Qt::UserRole + 1,
        WeightRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_notes.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addWeightRecord(QDate date, int weight);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
    Q_INVOKABLE void updateRecord(int indx,QDate date,int weight);
    Q_INVOKABLE int findRecord(QDate date);
private:
    QList<WeightRecord> m_notes;
};

#endif // WEIGHTLIST_H
