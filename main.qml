import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            Button{

            }
        }

        Page2Form {
            GridLayout{
                anchors.fill: parent
                columns: 3

                BusyIndicator{
                    id: bsi
                    Layout.column: 0
                    Layout.row: 0
                }

                Label{
                    text: "MoscowPolytechPlayer"
                    Layout.column: 1
                    Layout.row: 0
                    font.family: "Arial"
                    font.pixelSize: 30
                }




            }

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
