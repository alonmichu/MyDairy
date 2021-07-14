import QtQuick 2.0

Item
{
    property alias model: profileModel
    function createProfile(name, surname, age) {
        profileModel.clear()
        profileModel.append({
                              name: name,
                              surname: surname,
                              age: parseInt(age,10)
                          });
        }
    ListModel
    {
        id: profileModel
        ListElement
        {
            name: "Имя"
            surname: "Фамилия"
            age: 0
        }
    }
}
