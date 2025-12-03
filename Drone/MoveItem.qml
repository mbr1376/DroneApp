import QtQuick

Item {
    width: 200
    height: 200
    signal moveLeft(real val)
    signal moveRight(real val)
    signal moveFront(real val)
    signal moveBack(real val)
    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.8)
        radius: 15

    }
    Image {
        id: _img
        anchors.centerIn: parent
        source: "resource/move.png"

        MouseArea {
            id: mouseArea_right
            x: 141
            y: 84
            width: 26
            height: 24
            onClicked: {
                //console.log("right")
                    right(10)
            }
        }

        MouseArea {
            id: mouseArea_left
            x: 21
            y: 84
            width: 26
            height: 24
            onClicked: {
                //console.log("left")
                    left(10)
            }
        }

        MouseArea {
            id: mouseArea_up
            x: 82
            y: 22
            width: 26
            height: 24
            onClicked: {
                //console.log("up")
                front(10)
            }
        }

        MouseArea {
            id: mouseArea_down
            x: 82
            y: 140
            width: 26
            height: 24
            onClicked: {
                //console.log("down")
                    back(10)
            }
        }
    }
}
