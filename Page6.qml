import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtMultimedia 5.4
import QtWinExtras 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.12
import QtWebView 1.1


Page{
    id:page6
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
                    text: "Lab 6. Запросы по Rest API"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }


    ScrollView{
            anchors.fill: parent
            Item{
            }

        ColumnLayout{

            anchors.fill: parent
            Layout.alignment: Qt.AlignHCenter

        RowLayout{
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            RadioButton{ // выбор, что отображается на страничке
                id: rad_1 // id
                Material.accent: Material.Teal
                //Layout.alignment: Qt.AlignLeft
                text: "Столбцы" // подпись
                checked: true // выбран по умолчанию
                onCheckedChanged: // если сменен выбор
                    if(rad_1.checked === true){ // если выбран rad1
                        grid.visible = true
                        list.visible = false
                    }
            }
            RadioButton{ // выбор, что отображается на страничке
                id: rad_2 // id
                Material.accent: Material.Teal
                //Layout.alignment: Qt.AlignRight
                text: "Строки" // подпись
                checked: false
                onCheckedChanged: // если вменен выбор
                    if(rad_2.checked === true){ // если выбран rad2
                        list.visible = true // видео не отображается
                        grid.visible = false // слайдер не отображается
                    }
            }
        }


            GridView{
                id: grid
                visible: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                enabled: true
                cellHeight: 150
                cellWidth: 300
                model: mail_model

                //spacing: 10

                delegate: Rectangle{
                    color: "white"
                    width: 300
                    height: 150
                    border.color: Material.Teal
                    Layout.margins: 10
                    GridLayout{
                        anchors.fill: parent
                        columns: 3
                        rows: 3
                        //Layout.margins: 20
                        Image{
                            source: pic50x50
                            Layout.column: 0
                            Layout.row: 0
                            Layout.rowSpan: 3
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            Layout.margins: 5
                            fillMode: Image.PreserveAspectFit
                        }
                        Label{ // имя файла
                            color: "black"
                            text: "Имя файла " + file_name
                            Layout.column: 1
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                        Label{ // фамилия
                            color: "black"
                            text: "Дата изменения " + file_change
                            Layout.column: 1
                            Layout.row: 2
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                        Label{ // ID
                            color: "black"
                            text: "Размер файла " + file_size
                            Layout.column: 1
                            Layout.row: 3
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                    }
                }
            }

            ListView{
                id: list
                visible: false
                Layout.fillHeight: true
                Layout.fillWidth: true
                enabled: true
                model: mail_model
                spacing: 30

                delegate: Rectangle{
                    color: "white"
                    width: 600
                    height: 100
                    border.color: Material.Teal
                    Layout.margins: 10
                    GridLayout{
                        anchors.fill: parent
                        columns: 3
                        rows: 3
                        //Layout.margins: 20
                        Image{
                            source: pic50x50
                            Layout.column: 0
                            Layout.row: 0
                            Layout.rowSpan: 3
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            Layout.margins: 5
                            fillMode: Image.PreserveAspectFit
                        }
                        Label{ // имя
                            color: "black"
                            text: "Имя файла" + file_name
                            Layout.column: 1
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                        Label{ // фамилия
                            color: "black"
                            text: "Дата изменения " + file_change
                            Layout.column: 2
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                        Label{ // ID
                            color: "black"
                            text: "Размер файла " + file_size
                            Layout.column: 3
                            Layout.row: 1
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            //Layout.margins: 20
                        }
                    }
                }
            }
        }
        }


    }
