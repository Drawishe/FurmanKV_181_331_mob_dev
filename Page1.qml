import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    id: page1
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
                    text: "Lab 1. Элементы графического интерфейса"
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
            
            BusyIndicator{
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
            }
            
            Item{
                Layout.fillWidth: true
            }
            
        }
        
    }
    
}
