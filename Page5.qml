import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtWebView 1.14


Page{
    id: page5
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
                    text: "Lab 5. Аутентификация OAuth2 в мобильном приложении"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }
    Connections{
        target: httpcontroller
        function onToQML3(str1, str2){            
            rectg15.visible = true;            
            url5.visible = true
            url51.visible = true
            access5.visible = true
            accesst5.visible = true
            accesst51.visible = true
            url51.text = str1;            
            accesst51.text = str2;
            webv.visible = false;
            debug.visible = false;
            rectgweb.visible = false
            logt.visible = false
            logf.visible = false
            passf.visible = false
            passt.visible = false
            logb.visible = false
            regb.visible = false
        }
    }
    Connections{
        target: httpcontroller
        function onToQML4(){
            webv.visible = false;
            rectg25.visible = true;
            debug.visible = false;
        }
    }

    GridLayout{
        anchors.fill:parent
        columns:5
        rows:5

            Rectangle{
                Layout.row: 0
                Layout.rowSpan: 2
                Layout.column: 0
                Layout.columnSpan: 4

                id: rectgweb
                color: "#FFFFFF"
                visible: false
                Layout.fillHeight: true
                Layout.fillWidth: true


                WebView{
                    id: webv
                    anchors.fill: parent
                    visible: false
                    url: "https://oauth.yandex.ru/authorize?response_type=token&client_id=7863e8b33d714436bb78eb8ed3232523&redirect_uri=https://yandex.ru/video"
                    onLoadingChanged: {
                        debug.text = webv.url;
                        httpcontroller.token(webv.url);
                    }
                }
            }
            Text {
                id: logt
                Layout.row: 0
                Layout.column: 1
                Layout.columnSpan: 2
                text: qsTr("Логин")
            }
            TextField{
                Layout.row: 0
                Layout.column: 2
                id: logf

            }
            Text{
                id:passt
                Layout.row: 1
                Layout.column: 1
                text: qsTr("Пароль")
            }
            TextField{
                Layout.row: 1
                Layout.column: 2                
                id:passf

            }
            Button{
                id: logb
                text: qsTr("Войти")
                Layout.row: 2
                Layout.column: 1
                Material.foreground: "#FFFFFF"
                Material.background: Material.Teal
            }

            Button{
                id: regb
                text: qsTr("Зарегистрироваться")
                Layout.row: 2
                Layout.column: 2
                Material.foreground: "#FFFFFF"
                Material.background: Material.Teal
                onClicked: {
                    webv.visible=true
                    regb.visible=false
                    logb.visible=false
                    logt.visible=false
                    logf.visible=false
                    passf.visible=false
                    passt.visible=false
                    rectgweb.visible=true

                }
            }

            Item{
                Layout.row: 0
                Layout.rowSpan: 4
                Layout.column: 0
                Layout.fillWidth: true
            }

            Item{
                Layout.row: 0
                Layout.rowSpan: 4
                Layout.column: 4
                Layout.fillWidth: true
            }

            Rectangle{
                id: rectg15
                border.color: "#009688"
                border.width: parent.width * 0.02
                visible: false
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.row: 1
                Layout.rowSpan: 4
                Layout.column: 1
                Layout.columnSpan: 4
            }


            Text{
                id: access5
                Layout.row: 2
                Layout.column: 2
                Layout.columnSpan: 3
                visible: false
                font.pointSize: 18
                text: "Доступ разрешен!"
                Layout.alignment: Qt.AlignCenter
            }

            Text{
                id: accesst5
                Layout.row: 3
                Layout.column: 2
                visible: false
                font.pointSize: 16
                text: "Access Token: "
            }

            Text {
                id: accesst51
                Layout.row: 3
                Layout.column: 3
                visible: false
                font.pointSize: 10
            }

            Text{
                id: url5
                Layout.row: 4
                Layout.column: 2
                visible: false
                font.pointSize: 16
                width: 30
                text: "URL: "
            }

            Text{
                id: url51
                Layout.row: 4
                Layout.column: 3
                visible: false
                font.pointSize: 10
                wrapMode: Text.WrapAnywhere
                Layout.fillWidth: true
            }

            TextArea{
                Layout.fillWidth: true
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 4
                id: debug
                font.pointSize: 10
                wrapMode: TextArea.Wrap
            }

    }

}
