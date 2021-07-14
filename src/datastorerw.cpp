#include <QDir>
#include <QDebug>
#include <QFile>
#include <QDate>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "datastorerw.h"
//#include "weightrecord.h"

namespace DSWPrivate {
    QString formDataFilePath();
    void createDataPath();

    QJsonObject convertNoteToJsonObject(WeightRecord &note);
    WeightRecord convertJsonObjectToNote(QJsonObject &jsonObject);
};

QString DSWPrivate::formDataFilePath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("data.json"));
}

void DSWPrivate::createDataPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

WeightRecord DSWPrivate::convertJsonObjectToNote(QJsonObject &jsonObject) {
    return WeightRecord(
        QDate::fromString(jsonObject["date"].toString()),
        jsonObject["weight"].toInt()
    );
}

QJsonObject DSWPrivate::convertNoteToJsonObject(WeightRecord &note) {
    QJsonObject noteObject;
    noteObject["date"] = note._date.toString();
    noteObject["weight"] = note._weight;
    return noteObject;
}

QList<WeightRecord> DataStorerW::readData() {
    QList<WeightRecord> notes;
    qDebug() << "Data file path: " << DSWPrivate::formDataFilePath();
    QFile dataFile(DSWPrivate::formDataFilePath());
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
        notes.append(DSWPrivate::convertJsonObjectToNote(jsonObject));
    }
    return notes;
}

void DataStorerW::storeData(QList<WeightRecord> &notes) {
    QJsonArray jsonArray;
    foreach(WeightRecord note, notes) {
        jsonArray.append(DSWPrivate::convertNoteToJsonObject(note));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    DSWPrivate::createDataPath();
    QFile dataFile(DSWPrivate::formDataFilePath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}
