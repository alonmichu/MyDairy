import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog
{
    id: profileEditor
    property string name: ""
    property string surname: ""
    property string age: ""

    DialogHeader
    {
        id: editorHeader
        title: qsTr("Профиль")
    }

    SilicaFlickable
    {
        ProfileList
        {
             id: profileModel
         }
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
                text: qsTr("Имя:")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextField
            {
                id: nameField
                width: parent.width
                text: qsTr(profileEditor.name)
            }
            Label
            {
                text: qsTr("Фамилия")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextArea
            {
                id: surnameField
                width: parent.width
                text: qsTr(profileEditor.surname)
            }
            Label
            {
                text: qsTr("Возраст")
                font.pixelSize: Theme.fontSizeSmall
            }
            TextArea
            {
                id: ageField
                width: parent.width
                text: qsTr(profileEditor.age)
            }
        }
    }
    onAccepted:
    {
        profileEditor.name = nameField.text
        profileEditor.surname = surnameField.text
        profileEditor.age = ageField.text
    }
}
