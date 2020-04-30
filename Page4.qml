import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    Connections{
            target: httpcontroller
            function onToQML(pString){
                https.append(pString);
            }
        }
    id: page4
    header:
        
        
        GridLayout {
        
        anchors.fill: parent
        columns: 4
        RowLayout{
            Layout.fillWidth: true

            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 4

            Item{
                Layout.fillWidth: true

            }

            RadioButton{
                id: lab4html
                checked: true
            }

            RadioButton{
                id: lab4parce
            }

            Item{
                Layout.fillWidth: true

            }
        }
        
        
        RowLayout{
            visible: {if(lab4html.checked){true}else{false}}
            Layout.fillWidth: true
            
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 4
            
            Item{
                Layout.fillWidth: true
                
            }
            ScrollView{
                id: scrlview
                anchors.fill: parent
                TextArea{
                    id: https
                    readOnly: true
                }
            }
            
            Item{
                Layout.fillWidth: true
                
            }
        }
        
        RowLayout{
            visible: {if(lab4html.checked){true}else{false}}
            Layout.fillWidth: true
            
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 4
            
            Button{
                text: "Вывод"
                Layout.fillWidth: true
                id: btnHttps
                onClicked: {
                    makeRequest();
                }
                
            }
            
            
        }
        RowLayout{
            visible: {if(lab4parce.checked){true}else{false}}
            Layout.fillWidth: true
            
            Layout.row: 2
            Layout.column: 0
            Layout.columnSpan: 4
            
            Label{
                text: "Курс Злотого:"
            }
            
            TextArea{
                id: zloty
            }
            
            
        }
        
    }
    
    
    
    
}
