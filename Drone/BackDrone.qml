import QtQuick

Rectangle{
    id: rectangle
    width: 600
    height: 400
    color: "transparent"
    property real compass
    property real _level
    property real _height: _info.height
    property real distance
    property real speed
    property real battery
    signal getCapture();
    signal getVideo(bool check);
    signal rotate(real val)
    signal heading(real val)

    signal moveLeft(real val)
    signal moveRight(real val)
    signal moveFront(real val)
    signal moveBack(real val)
    Component.onCompleted: {
        _camera.getCapture.connect(getCapture)
        _camera.getVideo.connect(getVideo)
        _info.heading.connect(heading)
        _info.rotate.connect(rotate)
        _move.moveLeft.connect(moveLeft)
        _move.moveRight.connect(moveRight)
        _move.moveFront.connect(moveFront)
        _move.moveBack.connect(moveBack)
    }

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
        rotate: compass
    }
    CameraItem{
        id:_camera
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    MoveItem{
        id:_move
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom:parent.bottom
        anchors.bottomMargin: 5
    }
    InfoItem{
        id: _info
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        _level:_level
    }
    PanelInfo{
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        battery: battery
        distance: distance
        speed: speed

    }
}
