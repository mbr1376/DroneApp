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
            source: "file:///home/mbr/Downloads/video.mp4" //"https://as6.asset.aparat.com/aparat-video/3c47b92188311ca9cef164cb45d1b39d9078934-480p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjlhMzE3ZDY3MGJkZTY3ZDI0ODNiYmU5NzVlYWY4NGZjIiwiZXhwIjoxNzY0ODcyMDM2LCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.BnklbkzlqwAAyJ9nmXDq4BgClMt4_aR0d4x0cPoVumM"
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
