import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    id: page7
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
                    text: "Lab 7. Шифрование данных"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }

            GridLayout{
                anchors.fill: parent
                columns: 2
                rows: 3

                TextField {
                    id: cryptokey
                    Layout.row: 0
                    Layout.column: 0
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    maximumLength: 32
                    font.pointSize: 15
                }
                Button{
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillWidth: true
                    text: qsTr("Зашифровать")
                    onClicked: if(cryptokey.length==32){test.encryption(cryptokey.text)}
                }
                Button{
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillWidth: true
                    text: qsTr("Расшифровать")
                    onClicked: if(cryptokey.length==32){test.decryption(cryptokey.text)}
                }
                Text {
                    Layout.row: 2
                    Layout.column: 0
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    id: keylen
                    text: cryptokey.length
                }
            }


        }



