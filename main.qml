import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 480
    height: 640
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
                columns: 4

                BusyIndicator{
                    id: bsi
                    Layout.column: 0
                    Layout.row: 0
                }

                Label{
                    text: "MoscowPolytechPlayer"
                    Layout.column: 1
                    Layout.columnSpan: 4
                    Layout.fillWidth: true
                    Layout.row: 0
                    font.family: "Arial"
                    font.pixelSize: 30
                }

                TextField{
                    text: "Never gonna give you up"
                    Layout.column: 1
                    Layout.columnSpan: 2
                    Layout.row: 1
                }

                ProgressBar{
                    value: 0.5
                    Layout.row: 2
                    Layout.column: 0
                    Layout.columnSpan: 4
                    Layout.fillWidth: true
                }

                Button{
                    id:btn1
                    Layout.row: 3
                    Layout.column: 1
                }

                Button{
                    id:btn2
                    Layout.row: 3
                    Layout.column: 2
                }

                Button{
                    id:btn3
                    Layout.row: 3
                    Layout.column: 3
                }

                Slider{
                    Layout.row: 4
                    Layout.column: 0
                }

                Switch{
                    Layout.row: 4
                    Layout.column: 4
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
