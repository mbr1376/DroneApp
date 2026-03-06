import QtQuick
import QtMultimedia
Item{

    width: 600
    height: 400
    signal getCapture();
    signal getVideo(bool check);
    signal rotate(real val)
    signal headingQuad(real val)

    signal moveLeft(real val)
    signal moveRight(real val)
    signal moveFront(real val)
    signal moveBack(real val)
    Component.onCompleted: {

        player.play()

            back.getCapture.connect(DroneApi.getCapture)
            back.getVideo.connect(DroneApi.getVideo)
            back.heading.connect(DroneApi.headingQuad)
            back.rotate.connect(DroneApi.rotate)
            back.moveLeft.connect(DroneApi.moveLeft)
            back.moveRight.connect(DroneApi.moveRight)
            back.moveFront.connect(DroneApi.moveFront)
            back.moveBack.connect(DroneApi.moveBack)
            back.heightChange.connect(DroneApi.heightChange)
    }
    MediaPlayer {
            id: player
            source: DroneApi.rtspurl
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
        compass: DroneApi.heading
        _level: DroneApi.level
        distance: DroneApi.distance
        speed: DroneApi.speed
        battery: DroneApi.battery

    }
}
