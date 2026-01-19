import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import RoniaKit

Item {
    id: item1
    width: 160
    height: 200
    property real _level: 0.0
    property real _height: level.value
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
        width: 50
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
    LevelGauge {
        id: level
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter:  parent.horizontalCenter
        //anchors.right: _col.left
        rangeControl.minimumValue:0
        rangeControl.maximumValue:1000
        height: parent.height -20
        width: 50
        theme: RoniaControl.Theme.Dark
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton

            onPressed: (mouse) => updateValue(mouse.y)
            onPositionChanged: (mouse) => updateValue(mouse.y)

            function updateValue(y) {
                var minV = level.rangeControl.minimumValue
                var maxV = level.rangeControl.maximumValue

                // clamp
                y = Math.max(0, Math.min(level.height, y))

                // بالا = max
                var ratio = 1.0 - (y / level.height)
                level.value = minV + ratio * (maxV - minV)
            }
        }
    }
    Column{
        id:_col1
        width: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: level.left
        anchors.rightMargin: 5
        spacing: 60
        Column{
            spacing: 5
            Text {
                text: qsTr("Level")
                color: "gray"

                font.bold: true
                font.family: _font.name
                font.pixelSize: 12
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
                font.pixelSize: 12
            }
            Text {
                text: Math.round(level.value) + "m"
                font.bold: true
                color: "#FFFFFF"
                font.family: _font.name
                font.pixelSize: 10
            }
        }
    }
}
