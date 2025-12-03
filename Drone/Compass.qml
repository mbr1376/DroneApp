import QtQuick

Item {
    width: 170
    height: 170
    property real rotate
    FontLoader{
        id: _font
        source: "resource/font/Poppins-Regular.ttf"
    }

    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.8)
        radius: 15

    }


    Image {
        id: image
        anchors.centerIn:  parent
        source: "resource/backcompass.png"
        Image {
            rotation: rotate
            id: name
            source: "resource/compass.png"
            anchors.centerIn: parent
        }
    }
    Rectangle{
        width: 30
        height: 17
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.rightMargin: 10
        color: "#FF2F2F"
        radius: 5
        Text {
            anchors.centerIn: parent
            font.pixelSize: 9
            font.family: _font.name
            text: rotate
            color: "#FFFFFF"
        }
    }

}
