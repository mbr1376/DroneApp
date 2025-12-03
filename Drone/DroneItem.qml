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
            source: "https://as6.asset.aparat.com/aparat-video/3c47b92188311ca9cef164cb45d1b39d9078934-720p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjdlOTYwZDRhZGI4ZTAwZDVlYTU2NjUyN2Q3NGU5NTVlIiwiZXhwIjoxNzY0NzYxMDQwLCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.ulrsZMj0NEpkIaUYYgjygHhdmEVi5OAqS4W_Sprg2hU" //"file:///Users/mbr/DroneApp/Drone/resource/video.mp4" //Qt.resolvedUrl("/Users/mbr/DroneApp/Drone/resource/video.mp4")      // FULL PATH
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
