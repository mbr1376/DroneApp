import QtQuick
import RoniaKit
Item {
    id: item1
    width: 120
    height: 250
    property real distance: 12.3
    property real speed: 200
    property real battery: 56

    FontLoader{
        id: _font
        source: "resource/font/Poppins-Regular.ttf"
    }
    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.8)
        radius: 15

    }
    Column{
        id: row
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 1
        Column{
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("Distance")
                color: "gray"
                font.bold: true
                font.family: _font.name
                font.pixelSize: 10
            }
            Text {
                text: distance + " Km"
                font.bold: true
                color: "#FFFFFF"
                font.family: _font.name
                font.pixelSize: 18
            }
        }
            CircularSpeedGauge{
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 100
                rangeControl.maximumValue:200
                rangeControl.minimumValue: 0
                name: "Speed Km/h"
                value: speed

            }

            FuelGauge{
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 100
                value: battery
                rangeControl.minimumValue: 0
                rangeControl.maximumValue: 100
            }
    }

}
