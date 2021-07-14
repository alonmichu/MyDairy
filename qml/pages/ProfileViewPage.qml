import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    property alias profileName: profileNameLabel.text
    property alias profileSurname: profileTextLabel.text
    property alias profileAge: profileAgeLabel.text

    SilicaFlickable
    {
        anchors.fill: parent
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

            PageHeader
            {
                title: qsTr("Информация профиля")
            }
            Label
            {
                text: qsTr("Имя:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: profileNameLabel
                color: Theme.highlightColor
            }
            Label
            {
                text: qsTr("Фамилия:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: profileTextLabel
                color: Theme.highlightColor
            }
            Label
            {
                text: qsTr("Возраст:")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label
            {
                id: profileAgeLabel
                color: Theme.highlightColor
            }
        }
        VerticalScrollDecorator {}
    }
}

