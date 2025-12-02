import QtQuick

Item {
    id: item1
    width: 300
    height: 50
    property real distance: 12.3
    property real speed: 20.2
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
    Row{
        id: row
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 25
        Column{
            spacing: 5
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
        Column{
            spacing: 5
            Text {
                text: qsTr("Speed")
                color: "gray"
                font.bold: true
                font.family: _font.name
                font.pixelSize: 10
            }
            Text {
                text: speed + " Km/h"
                font.bold: true
                color: "#FFFFFF"
                font.family: _font.name
                font.pixelSize: 18
            }
        }

    }
    Row{
        id: row1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5
        spacing: 3
        Image {
            id: name
            source: "resource/battery.png"
        }
        Text {
            text: battery + " %"
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            color: "#FFFFFF"
            font.family: _font.name
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
