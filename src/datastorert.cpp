#include <QDir>
#include <QDebug>
#include <QFile>
#include <QDate>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>


#include "datastorert.h"

namespace DSTPrivate {
    QString formDataFilePath();
    void createDataPath();

    QJsonObject convertNoteToJsonObject(TrainingRecord &note);
    TrainingRecord convertJsonObjectToNote(QJsonObject &jsonObject);
};

QString DSTPrivate::formDataFilePath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("data.json"));
}

void DSTPrivate::createDataPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

TrainingRecord DSTPrivate::convertJsonObjectToNote(QJsonObject &jsonObject) {
    return TrainingRecord(
        jsonObject["dayindex"].toInt(),
        jsonObject["text"].toString()
    );
}

QJsonObject DSTPrivate::convertNoteToJsonObject(TrainingRecord &note) {
    QJsonObject noteObject;
    noteObject["dayindex"] = note._dayindex;
    noteObject["text"] = note._text;
    return noteObject;
}

QList<TrainingRecord> DataStorerT::readData() {
    QList<TrainingRecord> notes;
    qDebug() << "Data file path: " << DSTPrivate::formDataFilePath();
    QFile dataFile(DSTPrivate::formDataFilePath());
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
        notes.append(DSTPrivate::convertJsonObjectToNote(jsonObject));
    }
    return notes;
}

void DataStorerT::storeData(QList<TrainingRecord> &notes) {
    QJsonArray jsonArray;
    foreach(TrainingRecord note, notes) {
        jsonArray.append(DSTPrivate::convertNoteToJsonObject(note));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    DSTPrivate::createDataPath();
    QFile dataFile(DSTPrivate::formDataFilePath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}


