import QtQuick

Rectangle{
    id: rectangle
    width: 600
    height: 400
    color: "transparent"
    Image {
                width: 100
                height: 100
                anchors.centerIn: parent
                source: "./resource/camera.png"
                fillMode: Image.PreserveAspectFit

    }

    Compass{
        id:_compass
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    CameraItem{
        id:_camera
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top:_compass.bottom
        anchors.topMargin:15
    }
    MoveItem{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top:_camera.bottom
        anchors.topMargin:15
    }
    InfoItem{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
    }
    PanelInfo{
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}
