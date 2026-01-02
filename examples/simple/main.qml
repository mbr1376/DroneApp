import QtQuick
import Drone 1.0
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    DroneItem{
        anchors.fill :parent
        rtspurl:"https://aspb12.asset.aparat.com/aparat-video/08fbd78a34d4eefe5bfcec54f00114f09091356-360p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjgwNjc1NTg1OTQ5MzU5ZWE3MzA0MGQ5ZGRiMzkxMmE4IiwiZXhwIjoxNzY3Mzk5OTY0LCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.nuZMmDC1XuKa0xMZR4rki5IQnnxI6TXQNEjosb6Y-NU"
    }

}
