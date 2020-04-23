import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    id: page1
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
