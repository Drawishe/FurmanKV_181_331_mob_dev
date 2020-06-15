import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page{
    id: page3
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
                    text: "Lab 3. Графические эффекты"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

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
            
            RadioButton{
                id:des
                checked: true
                text: "Desaturation"
                Material.accent: Material.Teal
            }
            
            RadioButton{
                id:rcBlur
                text: "Recoursive Blur"
                Material.accent: Material.Teal
            }
            
            RadioButton{
                id:gaBlur
                text: "Gaussian Blur"
                Material.accent: Material.Teal
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
                    fillMode: Image.PreserveAspectCrop
                    smooth: true
                    visible: false
                }

                Desaturate{
                    anchors.fill: rick
                    source: rick
                    desaturation: slideDesaturation.value                    
                }
            }
            
            Item{
                Layout.fillWidth: true                
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
                Material.accent: Material.Teal
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
                    //visible: false
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
            
            Item{
                Layout.fillWidth: true
                
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                from: 0
                value: 0
                to:100
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                Layout.column: 1
                Layout.columnSpan: 2
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
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
                Material.accent: Material.Teal
            }
            
            Item{
                Layout.fillWidth: true
                
            }
        }
        
        
        
        
    }}
