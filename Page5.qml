import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtWebView 1.14


Page{
    id: page5
    Connections{
        target: httpcontroller
        function onToQML3(str1, str2){
            webv.visible = false;
            rectg15.visible = true;
            debug.visible = false;
            url5.visible = true
            url51.visible = true
            url51.text = str1;
            accesst5.visible = true
            accesst51.visible = true
            accesst51.text = str2;
            rectgweb.visible = false
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
        columns:4
        rows:4

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
                    url: "https://oauth.yandex.ru/authorize?response_type=token&client_id=7863e8b33d714436bb78eb8ed3232523&redirect_uri=http://localhost"
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
                text: "Войти"
                Layout.row: 2
                Layout.column: 1
            }

            Button{
                id: regb
                text: "Зарегистрироваться"
                Layout.row: 2
                Layout.column: 2
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

            Rectangle{
                id: rectg15
                visible: false
                color: "#FFFFFF"
                Layout.row: 0
                Layout.rowSpan: 4
                Layout.column: 0
                Layout.columnSpan: 4
            }

                Text{
                    id: access5
                    Layout.row: 1
                    Layout.column: 0
                    Layout.columnSpan: 4
                    visible: false
                    font.pointSize: 18
                    //anchors.fill: parent
                    text: "Доступ разрешен!"
                }
                Text{
                    id: accesst5
                    Layout.row: 2
                    Layout.column: 1
                    //Layout.columnSpan: 4
                     //anchors.fill: parent
                    visible: false
                    font.pointSize: 16
                    text: "Access Token: "
                }

                Text {
                    id: accesst51
                    Layout.row: 2
                    Layout.column: 2
                    Layout.columnSpan: 2
                    // anchors.fill: parent
                    visible: false
                    font.pointSize: 10
                    wrapMode: TextArea.Wrap
                }
                Text{
                    id: url5
                    Layout.row: 3
                    Layout.column: 1
                    //Layout.columnSpan: 2
                    visible: false
                    font.pointSize: 16
                    width: 30
                    text: "URL: "
                }

                TextArea{
                    id: url51
                    Layout.row: 3
                    Layout.column: 2
                    Layout.columnSpan: 2
                    visible: false
                    font.pointSize: 10
                    wrapMode: TextArea.Wrap

                }

    }

}
