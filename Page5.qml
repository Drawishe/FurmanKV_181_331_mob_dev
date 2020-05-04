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
            url51.text = str1;
            accesst51.text = str2;
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


        RowLayout{
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 4

            Item{
                Layout.fillWidth: true

            }
            Rectangle{
                color: "#FFFFFF"
                width: 400
                height: 300
                WebView{
                    id: webv
                    anchors.fill: parent
                    visible: true
                    url: "https://oauth.yandex.ru/authorize?response_type=token&client_id=7863e8b33d714436bb78eb8ed3232523&redirect_uri=https://yandex.ru/video/"
                    onLoadingChanged: {
                        debug.text = webv.url;
                        httpcontroller.token(webv.url);
                    }
                }
            }



            Item{
                Layout.fillWidth: true

            }
        }



        RowLayout{
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 4

            Item{
                Layout.fillWidth: true

            }

            Rectangle{
                id: rectg15
                visible: false

                Text{
                    id: access5
                    font.pointSize: 18
                    text: "Access Granted!"
                }

                Text{
                    id: url5
                    font.pointSize: 16
                    width: 30
                    text: "URL: "
                }

                Text{
                    id: url51
                    font.pointSize: 10
                    wrapMode: TextArea.Wrap

                }

                Text{
                    id: accesst5
                    font.pointSize: 16
                    text: "Access Token: "
                }

                Text {
                    id: accesst51
                    font.pointSize: 10
                    wrapMode: TextArea.Wrap
                }
            }

            Rectangle{
                id: rectg25
                visible: false
                color: "#EA0101"

                Text {
                    id: access52
                    font.pointSize: 18
                    text: "Error! Access Denied!"

                }

                Button{
                    id: btn52
                    text: "Повторить"
                    font.pointSize: 16
                    onClicked:
                    {
                        rectg25.visible = false;
                        webv.visible = true; //видимость браузера
                        webv.url = "https://oauth.yandex.ru/authorize?" //первый url аутентификации
                                + "response_type=token"
                                + "&client_id=7863e8b33d714436bb78eb8ed3232523"
                                + "&redirect_uri=https://yandex.ru/video/"
                        ;



                        //[& device_id=<идентификатор устройства>]
                        //[& device_name=<имя устройства>]
                        //                    [& redirect_uri=<адрес перенаправления>]
                        //                    [& login_hint=<имя пользователя или электронный адрес>]
                        //                    [& scope=<запрашиваемые необходимые права>]
                        //                    [& optional_scope=<запрашиваемые опциональные права>]
                        //                    [& force_confirm=yes]
                        //                    [& state=<произвольная строка>]
                        //                    [& display=popup]
                    }

                }
            }

            Item{
                Layout.fillWidth: true

            }

        }
        RowLayout{
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 0
            Layout.columnSpan: 4

            Item{
                Layout.fillWidth: true

            }
            TextArea{
                id: debug
                font.pointSize: 10
                wrapMode: TextArea.Wrap
            }

            Item{
                Layout.fillWidth: true

            }

        }




    }

}
