import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


ApplicationWindow {
    signal makeRequest()
    signal apirequest();
    signal db_read();
    signal db_write();
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

        Page7 {
            id: page7
        }

        Page8 {
            id: page8
        }

        Page9 {
            id: page9
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
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 0;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 2"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 1
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 1;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 3"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 2
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 2;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 4"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 3;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 5"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 4;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 6"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 5;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 7"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 5
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 6;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 9"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 6
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 7;
                    drawer.close();
                }
            }
            Button{
                text: "Lab 10"
                Material.foreground: "#FFFFFF"
                font.bold: true
                font.pixelSize: 20
                Layout.row: 7
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#30d5c8"
                }
                onClicked: {
                    swipeView.currentIndex = 8;
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
