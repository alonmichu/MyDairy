#include <QDir>
#include <QDebug>
#include <QFile>
#include <QDate>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "datastorerd.h"

namespace DSDPrivate {
    QString formDataFilePath();
    void createDataPath();

    QJsonObject convertNoteToJsonObject(DayRecord &note);
    DayRecord convertJsonObjectToNote(QJsonObject &jsonObject);
};

QString DSDPrivate::formDataFilePath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("data.json"));
}

void DSDPrivate::createDataPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

DayRecord DSDPrivate::convertJsonObjectToNote(QJsonObject &jsonObject) {
    return DayRecord(
        QDate::fromString(jsonObject["date"].toString()),
        jsonObject["index"].toInt()
    );
}

QJsonObject DSDPrivate::convertNoteToJsonObject(DayRecord &note) {
    QJsonObject noteObject;
    noteObject["date"] = note._date.toString();
    noteObject["index"] = note._index;
    return noteObject;
}

QList<DayRecord> DataStorerD::readData() {
    QList<DayRecord> notes;
    qDebug() << "Data file path: " << DSDPrivate::formDataFilePath();
    QFile dataFile(DSDPrivate::formDataFilePath());
    if(!dataFile.exists()) {
        // Data does not exists
        return notes;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return notes;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return notes;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return notes;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        notes.append(DSDPrivate::convertJsonObjectToNote(jsonObject));
    }
    return notes;
}

void DataStorerD::storeData(QList<DayRecord> &notes) {
    QJsonArray jsonArray;
    foreach(DayRecord note, notes) {
        jsonArray.append(DSDPrivate::convertNoteToJsonObject(note));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    DSDPrivate::createDataPath();
    QFile dataFile(DSDPrivate::formDataFilePath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}
