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
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenterOffset: -50
    }
    Camera{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top:_compass.bottom
        anchors.topMargin:15
    }
}
