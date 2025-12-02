cmake_minimum_required(VERSION 3.16)

project(DronePlugin VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Qml)

qt_add_qml_module(DronePlugin
    URI DronePlugin
    VERSION 1.0
    QML_FILES
    DroneItem.qml
    RESOURCES resource/backgrand.png
    QML_FILES BackDrone.qml
    RESOURCES resource/camera.png
    QML_FILES Compass.qml
    RESOURCES resource/backcompass.png resource/compass.png
    RESOURCES resource/font/Poppins-Regular.ttf
    QML_FILES CameraItem.qml
    RESOURCES resource/lucide_video.png resource/ph_camera.png
    RESOURCES resource/move.png
    QML_FILES MoveItem.qml
    RESOURCES resource/rotate.png resource/heading.png
    QML_FILES InfoItem.qml
)
