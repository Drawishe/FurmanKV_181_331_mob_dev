import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


ApplicationWindow {
    signal makeRequest()
    visible: true
    width: 640
    height: 848
    title: qsTr("FurmanKV_181-331_MobDev")


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        //Lab1
        Page1 {
            id: page1
        }

        //Lab2
        Page2 {
            id: page2
        }

        //Lab3
        Page3 {
            id: page3
        }


        //Lab4
        Page4 {
            id: page4
        }

        //lab5
        Page5 {
            id: page5
        }

        Page6 {
            id: page6
        }





//        }
    }
    Drawer {
        id: drawer
        width: parent.width * 0.67
        height: parent.height
        dragMargin: 20
        ColumnLayout{
            anchors.fill: parent
            Button{
                text: "Lab 1"
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#808080"
                }
                onClicked: {
                    swipeView.currentIndex = 0;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 2"
                Layout.row: 1
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#808080"
                }
                onClicked: {
                    swipeView.currentIndex = 1;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 3"
                Layout.row: 2
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#808080"
                }
                onClicked: {
                    swipeView.currentIndex = 2;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 4"
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#808080"
                }
                onClicked: {
                    swipeView.currentIndex = 3;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 5"
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#808080"
                }
                onClicked: {
                    swipeView.currentIndex = 4;
                    drawer.close();
                }
            }
        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
    }
}
