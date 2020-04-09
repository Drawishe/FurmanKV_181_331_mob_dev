import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


ApplicationWindow {
    visible: true
    width: 640
    height: 848
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
                        text: "Never gonna give you up"
                        Layout.fillWidth: true
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
                        flat: true
                        text: "<<"
                    }

                    Button{
                        id:btn2
                        flat: true
                        text: "►"
                    }

                    Button{
                        id:btn3
                        flat: true
                        text: ">>"
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

                    Text {
                        text: qsTr("Volume:")
                        color: "#FFFFFF"
                        font.pixelSize: 15
                    }

                    Slider{                        
                    }

                    Item{
                    Layout.fillWidth: true
                    }

                    Text {
                        text: qsTr("Shake:")
                        color: "#FFFFFF"
                        font.pixelSize: 15
                    }

                    Switch{
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


            GridLayout{
                anchors.fill: parent
                columns: 4

                //Воспроизведение Видео
                //Медиаплеер
                RowLayout{
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 1
                    Layout.column: 0
                    visible: {if(video.checked){true}else{false}}

                    Item{
                        Layout.fillWidth: true
                    }

                    Rectangle{
                        width: 480
                        height: 300
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
                            anchors.fill: parent
                        }
                    }


                    Item{
                        Layout.fillWidth: true
                    }
                }

                //Таймлайн
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

                //Громкость и play/pause
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
                    Text {
                        text: qsTr("Volume:")
                        color: "#FFFFFF"
                        font.pixelSize: 15
                    }

                    Slider{
                        id: vol
                        from: 0
                        value: 0.5
                        to:1
                    }

                    //Кнопка Play|Pause
                    Button{
                        flat: true
                        text: mdplayer.playbackState === MediaPlayer.PlayingState ? "||" : "►"
                        onClicked: mdplayer.playbackState === MediaPlayer.PlayingState ?
                        mdplayer.pause() : mdplayer.play()


                    }



                    Item{
                        Layout.fillWidth: true
                    }

                }

                //Камера
                //Захват видео
                RowLayout{
                    visible: {if(cam.checked){true}else{false}}
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 1
                    Layout.column: 0

                    Item{
                        Layout.fillWidth: true
                    }
                    Rectangle{
                        width: 480
                        height: 320

                        Camera {
                            id: camera
                            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                            videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitrateEncoding;
                            videoRecorder.audioBitRate: 48000
                            videoRecorder.mediaContainer: "mp4"
                            videoRecorder.outputLocation: "D:/MobDev/FurmanKV_181_331_mob_dev/video"
                            videoRecorder.frameRate: 30.000

                            exposure {
                                exposureCompensation: -1.0
                                exposureMode: Camera.ExposurePortrait
                            }

                            //flash.mode: Camera.FlashRedEyeReduction

                            imageCapture {
                                onImageCaptured: {
                                    photoPreview.source = preview  // Show the preview in an Image

                                }
                            }
                        }

                        VideoOutput {
                            source: camera
                            anchors.fill: parent
                            focus : visible // to receive focus and capture key events when visible
                        }
                    }

                    Item{
                        Layout.fillWidth: true
                    }


                }

                //Блок кнопок
                RowLayout{
                    visible: {if(cam.checked){true}else{false}}
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    Layout.row: 2
                    Layout.column: 0

                    Item{
                        Layout.fillWidth: true
                    }

                    Button{
                        text: "photo"
                        onClicked: camera.imageCapture.captureToLocation("D:/MobDev/FurmanKV_181_331_mob_dev/photo")
                    }

                    Button{
                        text: "record"
                        onClicked: camera.videoRecorder.record()
                    }

                    Button{
                        text: "stop"
                        onClicked: camera.videoRecorder.stop()
                    }

                    Rectangle{
                    width: 80
                    height: 80

                        Image {
                            id: photoPreview
                            anchors.fill: parent
                        }
                        MouseArea{


                        }
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

                    RadioButton{
                        id:des
                    }

                    RadioButton{
                        id:rcBlur
                    }

                    RadioButton{
                        id:gaBlur
                    }

                    Item{
                        Layout.fillWidth: true

                    }
                }

                //Desaturation
                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(des.checked){true}else{false}}
                    Layout.row: 1
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
                    }
                }

                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(des.checked){true}else{false}}
                    Layout.row: 2
                    Layout.column: 0
                    Layout.columnSpan: 4

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

                //Recursive Blur

                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(rcBlur.checked){true}else{false}}
                    Layout.row: 1
                    Layout.column: 0
                    Layout.columnSpan: 4

                    Item{
                        Layout.fillWidth: true

                    }
                    Item{

                        width: 300; height: 300



                        Image {
                            id:rick1
                            source: "rick.png"
                            sourceSize: Qt.size(parent.width, parent.height)
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            visible: false
                        }

                        RecursiveBlur{
                            anchors.fill: rick1
                            source: rick1
                            radius:  slideRadius.value
                            loops: slideRec.value
                            progress: blPrg.value
                            transparentBorder: blTr.value
                        }
                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(rcBlur.checked){true}else{false}}
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
                    visible: {if(rcBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 3
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Loops:"
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
                    visible: {if(rcBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 4
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Progress:"
                    }

                    Slider{
                        id: blPrg
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
                    visible: {if(rcBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 5
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Transparent Border:"
                    }

                    CheckBox{
                        id:blTr
                    }

                    Item{
                        Layout.fillWidth: true

                    }
                }

                //Gaussian Blur

                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(gaBlur.checked){true}else{false}}
                    Layout.row: 1
                    Layout.column: 0
                    Layout.columnSpan: 4

                    Item{
                        Layout.fillWidth: true

                    }

                    Item{

                        width: 300; height: 300
                        Image {
                            id: rick2
                            source: "rick.png"
                            sourceSize: Qt.size(parent.width, parent.height)
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            visible: false


                        }


                        GaussianBlur{
                            anchors.fill: rick2
                            source: rick2
                            radius: gausRadius.value
                            samples:slideGaus.value
                            deviation: gausDevia.value
                            transparentBorder: gausTr.value

                        }


                    }

                    Item{
                        Layout.fillWidth: true

                    }

                }
                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(gaBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 2
                    Layout.column: 0

                    Item{
                        Layout.fillWidth: true

                    }
                    Label{
                        text: "Blur Radius:"
                    }

                    Slider {
                        id: gausRadius
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
                    visible: {if(gaBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 3
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Samples:"
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
                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(gaBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 4
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Transparent Border:"
                    }

                    CheckBox{
                        id:gausTr
                    }

                    Item{
                        Layout.fillWidth: true

                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    visible: {if(gaBlur.checked){true}else{false}}
                    Layout.columnSpan: 4
                    Layout.row: 5
                    Layout.column: 0
                    Item{
                        Layout.fillWidth: true

                    }

                    Label{
                        text: "Deviation:"
                    }

                    Slider{
                        id: gausDevia
                        from:0
                        value:0
                        to:1
                    }

                    Item{
                        Layout.fillWidth: true

                    }
                }




            }}


        //Lab4
        Page{




        }

        //lab5
        Page{

//            GridLayout{
//                anchors.fill:parent
//                columns:3
//                rows:3

//                Button{
//                    Layout.column:1
//                    Layout.row:2
//                    text:"Авторизация"
//                    onClicked:{
//                        //сделать браузер видимым, прогрузить первый юрл для аутентификации
//                        browser.visible = true;
//                        browser.url = ""
//                    }
//                }
//            }
//            WebView{
//                id:browser
//                visible:false
//                anchors.fill:parent
//                url:"https://google.com"
//                onLoadingChanged:{
//                    if(loadRequest==WebView.LoadStartedStatus)
//                        break;
//                    else if(loadRequest == webView.LoadSuccededStatus)
//                        console.info("***"+browser.url)
                    
//                }

//            }





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
        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

//        TabButton {
//            text: qsTr("Lab1")
//        }
//        TabButton {
//            text: qsTr("Lab2")
//        }
//        TabButton {
//            text: qsTr("Lab3")
//        }
//        TabButton {
//            text: qsTr("Lab4")
//        }
//        TabButton {
//            text: qsTr("Lab5")
//        }
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
