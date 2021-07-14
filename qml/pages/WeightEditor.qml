import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog
{
    id: weightEditor
    property string date: ""
    property string weight: ""
    property int ind: 0

    DialogHeader
    {
        id: editorHeader
        acceptText: qsTr("Ок")
        title: qsTr("Введите вес")
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
                left: parent.left
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
                id: weightDateField
                width: parent.width
                placeholderText: qsTr("DD.MM.YYYY")
                //placeholderText: qsTr(Date(Date.now().valueOf()).toString())
                text: qsTr(weightEditor.date)
            }
            Label
            {
                text: qsTr("Вес:")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextArea
            {
                id: weightNumArea
                width: parent.width
                text: qsTr(weightEditor.weight)
            }
        }
    }
    onAccepted:
    {
        weightEditor.date = weightDateField.text
        weightEditor.weight = weightNumArea.text
    }
}
