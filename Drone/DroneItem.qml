import QtQuick
import QtMultimedia

Item{

    width: 600
    height: 400
    // Image {
    //     id:back
    //     anchors.fill: parent
    //     source: "./resource/backgrand.png"
    //     fillMode: Image.Stretch

    // }
    Component.onCompleted: player.play()
    MediaPlayer {
            id: player
            source: "file:///Users/mbr/DroneApp/Drone/resource/video.mp4" //Qt.resolvedUrl("/Users/mbr/DroneApp/Drone/resource/video.mp4")      // FULL PATH
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
        anchors.fill: parent
    }
}
