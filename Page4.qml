import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    Connections{
           target: httpcontroller
           function onToQML(pString, nString){
               https.append(pString);
               zloty.text = nString;
           }
       }

    id: page4
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
                    text: "Lab 4. Запросы к серверу по протоколу HTTP"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }

        
        
        GridLayout {        
        anchors.fill: parent
        columns: 2

            Rectangle{
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                ScrollView{
                    id: scrlview
                    anchors.fill: parent
                    TextArea{
                        id: https
                        //textFormat: Text.RichText
                        readOnly: true
                        color: "#000000"

                    }
                }
            }
                        
            Button{
                Layout.fillWidth: true
                Layout.row: 1
                Layout.column: 0
                Layout.columnSpan: 2
                text: "Вывод"
                Material.foreground: "#FFFFFF"
                Material.background: Material.Teal
                //Layout.fillWidth: true
                id: btnHttps
                onClicked: {
                    makeRequest();
                }
            }
            
            Label{
                Layout.row: 2
                Layout.column: 0
                Layout.columnSpan: 1
                text: "Курс Злотого:"
            }
            
            TextArea{
                Layout.row: 2
                Layout.column: 2
                id: zloty
            }
    }
    
}
