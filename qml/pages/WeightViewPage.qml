import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    property alias weightDate: weightDateLabel.text
    property alias weightNum: weightNumLabel.text
    property int weightInd: 0

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
                title: qsTr("Информация")
            }
            Label
            {
                text: qsTr("Дата:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: weightDateLabel
                color: Theme.highlightColor
            }
            Label
            {
                text: qsTr("Вес:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id:weightNumLabel
                font.pixelSize: Theme.fontSizeSmall
            }
        }

        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("Изменить вес")
                onClicked:
                {
                    var dialog = pageStack.push(Qt.resolvedUrl("WeightEditor.qml"),{"date":weightModel.model.get(model.ind).date, "weight":weightModel.model.get(model.ind).weight});
                    dialog.accepted.connect(function() {
                        weightModel.updateRecord(weightInd,dialog.date,dialog.weight);
                        weightDate=dialog.date;
                        weightNum=dialog.weight;
                    });
                }
            }
            MenuItem
            {
                text: qsTr("Удалить")
                onClicked:
                {
                    weightModel.delRecord(weightInd);
                    pageStack.pop()
                }
            }
        }
        VerticalScrollDecorator {}
    }
}
