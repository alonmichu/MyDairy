import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog
{
    id: dairyEditor
    property string date: ""
    property string training: ""

    DialogHeader
    {
        id: editorHeader
        acceptText: qsTr("Ок")
        title: qsTr("Новая тренировка")
    }

    SilicaFlickable
    {
        anchors
        {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: editorHeader.bottom
        }

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

            Label
            {
                text: qsTr("Дата:")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextField
            {
                id: dairyDateField
                width: parent.width
                text:qsTr(dairyEditor.date)
                placeholderText: qsTr("DD.MM.YYYY")
                //placeholderText: qsTr(Date(Date.now().valueOf()).toString())
            }
            Label
            {
                text: qsTr("Упражнения:")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextArea
            {
                id: dairyTrainingArea
                width: parent.width
                text:qsTr(dairyEditor.training)
            }
        }
    }
    onAccepted:
    {
        dairyEditor.date = dairyDateField.text
        dairyEditor.training=dairyTrainingArea.text
    }
}
