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

        Page{
            GridLayout{
                anchors.fill: parent
                columns: 4

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true

                    }

                    BusyIndicator{
                        id: bsi

                    }

                    Label{
                        text: "MoscowPolytechPlayer"


                        font.family: "Arial"
                        font.pixelSize: 30
                    }

                    Item{
                    Layout.fillWidth: true
                    }
                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 1
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true
                    }

                    TextField{
                        text: "Never gonna give you up blabla"
    //                    Layout.column: 1
    //                    Layout.columnSpan: 3
                        Layout.fillWidth: true
    //                    Layout.row: 1
                    }

                    Item{
                    Layout.fillWidth: true
                    }
                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 2
                    Layout.column: 0

                    ProgressBar{
                        value: 0.25
    //                    Layout.row: 2
    //                    Layout.column: 0
    //                    Layout.columnSpan: 4
                        Layout.fillWidth: true
                    }
                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 3
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true
                    }

                    Button{
                        id:btn1
    //                    Layout.row: 3
    //                    Layout.column: 1
                    }


                    Button{
                        id:btn2
    //                    Layout.row: 3
    //                    Layout.column: 2
                    }

                    Button{
                        id:btn3
    //                    Layout.row: 3
    //                    Layout.column: 3
                    }

                    Item{
                    Layout.fillWidth: true
                    }
                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 4
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true
                    }

                    Slider{
    //                    Layout.row: 4
    //                    Layout.column: 0
    //                    Layout.columnSpan: 2
                    }

                    Item{
                    Layout.fillWidth: true
                    }

                    Switch{
    //                    Layout.row: 4
    //                    Layout.column: 4
    //                    Layout.fillWidth: true
                    }

                    Item{
                    Layout.fillWidth: true
                    }

                }

            }

        }

        Page{

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
