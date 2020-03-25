import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14

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

        Page{
            header: {
                    text: qsTr("The Third Lab")

            }
            GridLayout {

                anchors.fill: parent
                columns: 4 //колонка

            //Desaturate, RecursiveBlur, GaussianBlur
                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true

                    }
                    Item{

                        width: 100; height: 100
                        Layout.fillWidth: true


                        Image {
                            id: rick
                            source: "rick.png"
                            sourceSize: Qt.size(parent.width, parent.height)
                            fillMode: Image.PreserveAspectFit


                        }
                        Desaturate{
                            anchors.fill: rick
                            source: rick
                            desaturation: slideDesaturation.value

                        }
                        RecursiveBlur{
                            anchors.fill: rick
                            source: rick
                            radius:  slideRecBlur.value
                            loops: slideRecLoops.value
                        }
                        GaussianBlur{
                            anchors.fill: rick
                            source: rick
                            radius: slideGausBlur.value
                            samples:slideGausBlurSamp.value
                        }
                    }

                    Item{
                    Layout.fillWidth: true

                    }

                }
                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.column: 0

                    Item{
                    Layout.fillWidth: true

                    }
                    Slider{

                        id:slideDesaturation
                        from: 0
                        value: 0
                        to:1
                        // @disable-check M16
                        //text: qsTr("Desaturate")

                    }

                    Slider {
                        id: slideRecBlur
                        from: 0
                        value: 0
                        to:16
                    }
                    Slider{
                        id: slideRecLoops
                        from: 1
                        value: 0
                        to:100
                    }


                    Slider{
                        id:slideGausBlur
                        from: 0
                        value: 0
                        to:16
                    }
                    Slider{
                        id:slideGausBlurSamp
                        from: 0
                        value: 0
                        to:100
                    }



                    Item{
                    Layout.fillWidth: true

                    }


                }


            }
        }


    }
    Drawer {
        //anchors.fill:parent
        width:0.66 * parent.width
        height: parent.height
        GridLayout {
            anchors.fill: parent
            columns: 1
            Button{}
            Button{}
            Button{}
            Switch {
                onScaleChanged: {
                    text = "green";
                }
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Lab1")
        }
        TabButton {
            text: qsTr("Lab2")
        }
        TabButton {
            text: qsTr("Lab3")
        }
    }
}
