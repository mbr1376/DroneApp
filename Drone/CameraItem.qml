import QtQuick
import QtQuick.Controls
Item {
    width: 200
    height: 60
    signal getCapture();
    signal getVideo(bool check);
    FontLoader{
        id: _font
        source: "resource/font/Poppins-Regular.ttf"
    }
    Rectangle{
        id: rectangle
        anchors.fill:parent
        radius: 24
        color: Qt.rgba(0,0,0,0.8)
        Row{
            anchors.centerIn: parent
            spacing: 5
            Button{
                text: "Video"
                icon.source: "resource/lucide_video.png"
                font.family: _font.name
                font.pixelSize: 12
                checkable: true
                checked: true
                width: 90
                height: 40
                background: Rectangle{
                    color: parent.checked ? "#33FFFFFF" : "transparent"
                    radius: 5
                }
                onClicked: {
                        getVideo(checked)
                }

            }
            Button{
                text: "Camera"
                font.family: _font.name
                font.pixelSize: 12
                checkable: true
                icon.source: "resource/ph_camera.png"
                width: 90
                height: 40
                background: Rectangle{
                    color: parent.pressed ? "#33FFFFFF" : "transparent"
                    radius: 5
                }
                onClicked: {
                    getCapture()
                }

            }
        }

    }

}
