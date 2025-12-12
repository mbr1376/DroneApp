import QtQuick
import QtQuick.Window
//import "../../build/Qt_6_10_0_for_macOS-Debug/Drone" as Drone
import Drone 1.0
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Drone App")
    
    DroneItem {
        anchors.fill: parent
    }
}
