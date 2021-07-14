import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    property alias dairyDate: dairyDateLabel.text
    property alias dairyTraining: dairyTrainingLabel.text
    property int dairyInd: 0

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height
        Column
        {
            id: content
            anchors
            {
                left:parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            spacing: Theme.paddingMedium
            PageHeader
            {
                title: qsTr("")
            }
            Label
            {
                text: qsTr("Дата:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: dairyDateLabel
                color: Theme.highlightColor
            }
            Label
            {
                text: qsTr("Тренировка:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: dairyTrainingLabel
                font.pixelSize: Theme.fontSizeSmall
            }
        }
        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("Изменить тренировку")
                onClicked:
                {
                    var dialog = pageStack.push(Qt.resolvedUrl("DairyEditor.qml"),
                                                {"date":dairyModel.model.get(model.ind).date,
                                                    "training":dairyModel.model.get(model.ind).training});
                    dialog.accepted.connect(function() {
                        dairyModel.updateRecord(dairyInd,dialog.date,dialog.training);
                        dairyDate=dialog.date;
                        dairyTraining=dialog.training;
                    });
                }
            }
            MenuItem
            {
                text: qsTr("Удалить тренировку")
                onClicked:
                {
                    dairyModel.delRecord(dairyInd);
                    pageStack.pop()
                }

            }
        }
        VerticalScrollDecorator {}
    }
}


