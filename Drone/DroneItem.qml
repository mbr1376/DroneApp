import QtQuick
import QtMultimedia

Item{

    width: 600
    height: 400
    property url rtspurl: ""
    property real heading: 30.0
    property real level: 0.0
   readonly property real _height: back.height
    property real distance: 12.3
    property real speed: 20.2
    property real battery: 56
    signal getCapture();
    signal getVideo(bool check);
    signal rotate(real val)
    signal heading(real val)

    signal moveLeft(real val)
    signal moveRight(real val)
    signal moveFront(real val)
    signal moveBack(real val)
    Component.onCompleted: {

        player.play()

            back.getCapture.connect(getCapture)
            back.getVideo.connect(getVideo)
            back.heading.connect(heading)
            back.rotate.connect(rotate)
            back.moveLeft.connect(moveLeft)
            back.moveRight.connect(moveRight)
            back.moveFront.connect(moveFront)
            back.moveBack.connect(moveBack)
    }
    MediaPlayer {
            id: player
            source: rtspurl
            videoOutput: video
            //autoPlay: true
            loops: MediaPlayer.Infinite
        }

        VideoOutput {
            id: video
            anchors.fill: parent
            fillMode: VideoOutput.Stretch
        }
    BackDrone{
        id:back
        anchors.fill: parent
        compass: compass
        _level: level
        distance: distance
        speed: speed
        battery: battery

    }
}
