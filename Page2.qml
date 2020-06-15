import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    id: page2
    header: ToolBar{
            anchors.top: parent.top
            background: Rectangle{
                implicitHeight: 60
                implicitWidth: 100
                color: "#30d5c8"
            }
            GridLayout{
                columns: 3
                anchors.fill:parent

                Button{
                    id: drawerb
                    Layout.column: 0
                    onClicked: drawer.open()
                    font.pixelSize: 40
                    text: "="
                    flat: true
                }
                Label{
                    Layout.column: 0
                    Layout.columnSpan: 3
                    font.pixelSize: 18
                    text: "Lab 2. Запись и воспроизведение фото и видео"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }
    
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

        //Кнопка включения окна воспроизведения видео
        RadioButton{
            id: video
            checked: true
            text: qsTr("Video")
            Material.accent: Material.Teal
        }

        //Кнопка включения окна видеокамеры
        RadioButton{
            id: cam
            text: qsTr("Camera")
            Material.accent: Material.Teal
        }

        Item{
            Layout.fillWidth: true
        }
    }
        
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
