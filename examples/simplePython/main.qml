import QtQuick
import QtQuick.Window
import "../../build/Desktop_Qt_6_9_2-Debug/Drone" as Drone
//import Drone 1.0
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Drone App")
    
    Drone.DroneItem {
        anchors.fill: parent
    }
}
