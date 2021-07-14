import QtQuick 2.0
import Sailfish.Silica 1.0
import".."
Page
{
    id: weightListStorage
    SilicaListView
    {
        id: weightView
        anchors.fill: parent
        model: weightModel.model
        header: PageHeader
        {
            title: qsTr("Мой вес")
        }
        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("Добавить запись")
                onClicked:
                {
                    var dialog = pageStack.push(Qt.resolvedUrl("WeightEditor.qml"));
                    dialog.accepted.connect(function() {
                        weightModel.addWeightRecord(dialog.date,dialog.weight); });
                }
            }
        }

        delegate: BackgroundItem
        {
            Label
            {
                anchors
                {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: Theme.horizontalPageMargin
                    rightMargin: Theme.horizontalPageMargin
                }
                text: model.date
            }

            Component
            {
                id:weightViewStorage
                WeightViewPage {}
            }

            onClicked:
            {
                pageStack.push(weightViewStorage, {
                                   weightDate: model.date,
                                   weightNum: model.weight,
                                   weightInd: model.ind
                               });
            }
        }

        VerticalScrollDecorator {}
    }
}
