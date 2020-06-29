import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtCharts 2.3

Page {
    id: page8
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
                        text: "Lab 9. Графики"
                        font.bold: true
                        Layout.alignment: Qt.AlignCenter
                    }

                }
        }

    Connections{
        target: httpcontroller
        function onToQML9(png, jpeg, ttf, css, other){
            brs1.values = [png];
            brs2.values = [jpeg];
            brs3.values = [ttf];
            brs4.values = [css];
            brs5.values = [other];

        }
    }

    ChartView{
        id: chrv
        anchors.fill: parent
        title: "Количество файлов с определенным расширением"
        legend.alignment: Qt.AlignBottom
        BarSeries{ //данные (пары X-Y)

            axisX: BarCategoryAxis { categories: ["Current"] }
            // axisY: bvl91
            axisY: ValueAxis{id: bvl91; min: 0; max: 20;}
            BarSet{
                id: brs1;
                label: "Png";
                color: "green"
            }
            BarSet{
                id: brs2;
                label: "Jpeg";
                color: "blue"
            }
            BarSet{
                id: brs3;
                label: "Ttf";
                color: "red"
            }
            BarSet{
                id: brs4;
                label: "Css";
                color: Material.Teal
            }
            BarSet{
                id: brs5;
                label: "Другие";
                color: "pink"
            }
        }
    }
}
