import QtQuick
import Drone 1.0
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    DroneItem{
        anchors.fill :parent
    }

}
