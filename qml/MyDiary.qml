import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    initialPage: Component { Menu { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    ProfileViewPage
    {
        id: profilePageStorage
    }
    WeightViewPage
    {
        id:weightViewStorage
    }
    WeightListPage
    {
        id:weightListPage
    }
    WeightList
    {
        id: weightModel
    }
    DairyListPage
    {
        id:dairyListPage
    }
    DairyViewPage
    {
        id:dairyViewStorage
    }
    DairyList
    {
        id: dairyModel
    }
}
