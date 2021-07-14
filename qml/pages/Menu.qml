import QtQuick 2.0
import Sailfish.Silica 1.0
import".."

Page
{
    id: page
    ProfileList
    {
        id: profileModel
    }

    SilicaListView
    {
        id: profileView
        anchors.fill: parent
        model: profileModel.model
        header: PageHeader
        {
            id: headerMyDiary
            title: qsTr("Дневник тренировок")
        }

        Button
        {
            id: editProfileButton
            anchors
            {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin

            }
            text: "Редактировать профиль"
            onClicked:
            {
                var dialog = pageStack.push(Qt.resolvedUrl("ProfileEditor.qml"),
                                            {"name":profileModel.model.get(0).name,
                                                "surname":profileModel.model.get(0).surname,
                                                "age":profileModel.model.get(0).age.toString()});
                dialog.accepted.connect(function() {
                    profileModel.createProfile(dialog.name, dialog.surname,dialog.age);
                });
            }
        }

        Button
        {
            id: myProfileButton
            y: editProfileButton.y - 100
            anchors
            {
                left: parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            text: "Мой профиль"
            onClicked:
            {
                pageStack.push(profilePageStorage, {
                                   profileName: profileModel.model.get(0).name,
                                   profileSurname: profileModel.model.get(0).surname,
                                   profileAge: profileModel.model.get(0).age
                               });
            }
        }

        Button
        {
            id: weightButton
            y: editProfileButton.y + 100
            anchors
            {
                left: parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            text: "Отметить вес"
            onClicked: pageStack.push("WeightListPage.qml")
        }

        Button
        {
            id: dairyButton
            y: weightButton.y + 100
            anchors
            {
                left: parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            text: "Тренировки"
            onClicked: pageStack.push("DairyListPage.qml")
        }
    }
}
