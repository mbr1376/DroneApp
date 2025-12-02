import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
Item {
    id: item1
    width: 160
    height: 200
    property real _level: 0.0
    property real _height: slider.value
    signal rotate(real val)
    signal heading(real val)
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
        id:_col
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 5
        spacing: 60
        Button{
            text: "Video"
            icon.source: "resource/heading.png"
            icon.color: "#0e0e0e"
            display: AbstractButton.IconOnly
            checkable: true

            width:50
            height: 50
            background: Rectangle{
                color: parent.pressed ? "#33FFFFFF" : "#FFFFFF"
                radius: 10
            }
            onClicked: {
                heading(10)
                    //getVideo(checked)
            }

        }
        Button{
            text: "Camera"
            icon.color: "#0e0e0e"
            display: AbstractButton.IconOnly
            checkable: true
            icon.source: "resource/rotate.png"
            width: 50
            height: 50
            background: Rectangle{
                color: parent.pressed ? "#33FFFFFF" : "#FFFFFF"
                radius: 10
            }
            onClicked: {// This is available in all editors.
                rotate(10)
                //getCapture()
            }

        }
    }

    Slider {
        id: slider
        anchors.right: _col.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: 180
        width: 30
        from: 0
        to:  5000
        orientation: Qt.Vertical
        value: 0

        background: Rectangle {
            id: bg
            anchors.fill: parent
            anchors.margins: 12   // برای جادادن handle
            color: "transparent"

            Rectangle {
                id: groove
                width: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                radius: 5
                color: "#404040"

                Rectangle {
                    id: fillBar
                    width: 18
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: (1 - slider.visualPosition) * groove.height
                    anchors.bottom: parent.bottom
                    //height: slider.visualPosition * groove.height
                    radius: 4
                    color: "#00B4FF"

                    Behavior on height {
                        NumberAnimation { duration: 120 }
                    }
                }
            }
            Repeater {
                model: 10
                Rectangle {
                    visible: index !== 0 && index !== 9   // ✔ بالا و پایین نمایش داده نشود

                    width: 14
                    height: 1.4
                    color: "#FFFFFF"
                    anchors.horizontalCenter: bg.horizontalCenter
                    y: (index / 9) * bg.height
                }
            }
        }

        handle: Rectangle {
            width: 22
            height: 22
            radius: 11
            color: "#ffffff"
            border.color: "#00B4FF"
            border.width: 2

            x: (slider.width - width) / 2   // قرارگیری درست وسط

            // تبدیل حرکت اسلایدر به مختصات عمودی
            y: slider.topPadding +
               slider.visualPosition * (slider.availableHeight - height)

            Behavior on y {
                NumberAnimation { duration: 120 }
            }
        }
    }
    Column{
        id:_col1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: slider.left
        anchors.rightMargin: 5
        spacing: 60
        Column{
            spacing: 5
            Text {
                text: qsTr("Level")
                color: "gray"
                font.bold: true
                font.family: _font.name
                font.pixelSize: 14
            }
            Text {
                text: _level
                font.bold: true
                color: "#FFFFFF"
                font.family: _font.name
                font.pixelSize: 10
            }
        }
        Column{
            spacing: 5
            Text {
                text: qsTr("Height")
                font.bold: true
                color: "gray"
                font.family: _font.name
                font.pixelSize: 14
            }
            Text {
                text: Math.round(slider.value) + "m"
                font.bold: true
                color: "#FFFFFF"
                font.family: _font.name
                font.pixelSize: 10
            }
        }
    }
}
