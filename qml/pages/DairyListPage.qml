import QtQuick 2.0
import Sailfish.Silica 1.0
import".."

Page
{
    id: dairyListStorage
    SilicaListView
    {
        id: dairyView
        anchors.fill: parent
        model: dairyModel.model
        header: PageHeader
        {
            title: qsTr("Дневник Тренировок")
        }
        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("Добавить тренировку")
                onClicked:
                {
                    var dialog = pageStack.push(Qt.resolvedUrl("DairyEditor.qml"));
                    if(dairyModel.findRecord(dialog.date) === -1)
                    {
                        dialog.accepted.connect(function() {
                            dairyModel.addDairyRecord(dialog.date, dialog.training); });
                    }
                }

            }

//            MenuItem
//            {
//                text: qsTr("Фильтр")
//                onClicked:
//                {
//                    var dialog = pageStack.push(Qt.resolvedUrl("FilterChoosePage.qml"));
//
//               }
//
//            }
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
                id:dairyViewStorage
                DairyViewPage {}
            }

            onClicked:
            {
                pageStack.push(dairyViewStorage, {
                                   dairyDate: model.date,
                                   dairyTraining: model.training,
                                   dairyInd:model.ind
                               });
            }
        }

        VerticalScrollDecorator {}
    }
}
