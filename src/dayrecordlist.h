#ifndef DAYRECORDLIST_H
#define DAYRECORDLIST_H
#include <QAbstractListModel>
#include <QList>
#include "dayrecord.h"


class DayRecordList: public QAbstractListModel
{
    Q_OBJECT
public:
    explicit DayRecordList(QObject *parent=nullptr);

    // Note list
    enum DayRecordRoles {
        DateRole = Qt::UserRole + 1,
        IndexRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_notes.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addDayRecord(QDate date, int index);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    QList<DayRecord> m_notes;
};


#endif // DAYRECORDLIST_H
