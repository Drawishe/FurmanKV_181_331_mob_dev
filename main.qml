import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("FurmanKV_181-331_MobDev")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        //Lab1
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

        //Lab2
        Page{
            header:
                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.column: 0

                    Item{
                        Layout.fillWidth: true
                    }

                    //Кнопка включения окна воспроизведения видео
                    RadioButton{
                        id: video
                        checked: true
                        text: qsTr("Video")
                    }

                    //Кнопка включения окна видеокамеры
                    RadioButton{
                        id: cam
                        text: qsTr("Camera")
                    }

                    Item{
                        Layout.fillWidth: true
                    }
                }

            //Воспроизведение Видео
            GridLayout{
                anchors.fill: parent
                columns: 4

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 1
                    Layout.column: 0
                    visible: {if(video.checked){true}else{false}}

                    Item{
                        Layout.fillWidth: true
                    }


                    MediaPlayer{
                        id: mdplayer
                        source: "astley.mp4"
                        volume: vol.value
                        onPositionChanged: {
                            timeline.sync = true
                            timeline.value = mdplayer.position
                            timeline.sync = false
                        }


                    }
                    VideoOutput {
                        id: videoOutput
                        source: mdplayer
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
                    visible: {if(video.checked){true}else{false}}

                    //Таймлайн видео
                    Slider{
                        id: timeline
                        to: mdplayer.duration
                        property bool sync: false
                        onValueChanged: {if(!sync){mdplayer.seek(value)}}
                        Layout.fillWidth: true
                    }

                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 3
                    Layout.column: 0
                    visible: {if(video.checked){true}else{false}}

                    Item{
                        Layout.fillWidth: true

                    }

                    //Громкость звука
                    Slider{
                        id: vol
                        from: 0
                        value: 0.5
                        to:1
                    }

                    //Кнопка Play
                    Button{
                        onClicked: mdplayer.play();
                    }

                    //Кнопка Pause
                    Button{
                        onClicked: mdplayer.pause();
                    }

                    Item{
                        Layout.fillWidth: true
                    }

                }

                //Камера
                RowLayout{
                    visible: {if(cam.checked){true}else{false}}
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 3
                    Layout.column: 0

                    Item{
                        Layout.fillWidth: true
                    }
                    Camera {
                            id: camera

                            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                            exposure {
                                exposureCompensation: -1.0
                                exposureMode: Camera.ExposurePortrait
                            }

                            flash.mode: Camera.FlashRedEyeReduction

                            imageCapture {
                                onImageCaptured: {
                                    photoPreview.source = preview  // Show the preview in an Image
                                }
                            }
                        }

                        VideoOutput {
                            source: camera
                            //anchors.fill: parent
                            focus : visible // to receive focus and capture key events when visible
                        }

                        Image {
                            id: photoPreview
                        }

                    Item{
                        Layout.fillWidth: true
                    }
                }

            }




        }

        //Lab3
        Page{
            header:
                Button{
                    text: "="
                    Label{
                        text: "My photo filter app"
                    }

                }

            GridLayout {

                anchors.fill: parent
                columns: 4 //колонка

                // Задание - реализовать 
                //Desaturate, RecursiveBlur, GaussianBlur
                RowLayout{
                    Layout.fillWidth: true

                    Layout.row: 0
                    Layout.column: 0
                    Layout.columnSpan: 4

                    Item{
                        Layout.fillWidth: true

                    }
                    Item{

                        width: 300; height: 300



                        Image {
                            id: rick
                            source: "rick.png"
                            sourceSize: Qt.size(parent.width, parent.height)
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            visible: false


                        }
                        Desaturate{
                            anchors.fill: rick
                            source: rick
                            desaturation: slideDesaturation.value

                        }

                        RecursiveBlur{
                            anchors.fill: rick
                            source: rick
                            radius:  slideRadius.value
                            loops: slideRec.value
                        }

//                        GaussianBlur{
//                            anchors.fill: rick
//                            source: rick
//                            radius: slideRadius.value
//                            samples:slideGaus.value
//                        }


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
                    Label{
                        text: "Desaturation"

                    }
                    Slider{

                        id:slideDesaturation
                        from: 0
                        value: 0
                        to:1

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

                    Item{
                        Layout.fillWidth: true

                    }
                    Label{
                        text: "Blur Radius"
                    }

                    Slider {
                        id: slideRadius
                        from: 0
                        value: 0
                        to:16
                    }
                    Item{
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

                    Label{
                        text: "Recursive Blur"
                    }
                    Slider{
                        id: slideRec
                        from: 1
                        value: 0
                        to:100
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

                    Label{
                        text: "Gauss Blur"
                    }



                    Slider{
                        id:slideGaus
                        from: 1
                        value: 0
                        to:16
                    }



                    Item{
                        Layout.fillWidth: true

                    }


                }




            }
        }

        //Lab4
        Page{




        }

        //lab5
        Page{





        }
//        //lab6
//        Page{





//        }
//        //lab7
//        Page{





//        }
//        //lab8
//        Page{





//        }
//        //lab9
//        Page{





//        }
//        //lab10
//        Page{





//        }
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
        TabButton {
            text: qsTr("Lab4")
        }
        TabButton {
            text: qsTr("Lab5")
        }
//        TabButton {
//            text: qsTr("Lab6")
//        }
//        TabButton {
//            text: qsTr("Lab7")
//        }
//        TabButton {
//            text: qsTr("Lab8")
//        }
//        TabButton {
//            text: qsTr("Lab9")
//        }
//        TabButton {
//            text: qsTr("Lab10")
//        }
    }
}
