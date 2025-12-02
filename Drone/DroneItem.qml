import QtQuick

Item{

    width: 600
    height: 400
    Image {
        id:back
        anchors.fill: parent
        source: "./resource/backgrand.png"
        fillMode: Image.Stretch

    }
    BackDrone{
        anchors.fill: parent
    }
}
