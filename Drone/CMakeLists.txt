cmake_minimum_required(VERSION 3.16)

project(DronePlugin VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Qml)

add_subdirectory(ThirdParty/RoniaKit)
qt_add_qml_module(DronePlugin
    URI Drone
    VERSION 1.0

    SOURCES
        src/droneapi.cpp
        src/droneapi.h
        src/drenecore.cpp
        include/dronecore.h

    QML_FILES
        DroneItem.qml
        BackDrone.qml
        Compass.qml
        CameraItem.qml
        MoveItem.qml
        InfoItem.qml
        PanelInfo.qml

    RESOURCES
        resource/backgrand.png
        resource/camera.png
        resource/backcompass.png
        resource/compass.png
        resource/font/Poppins-Regular.ttf
        resource/lucide_video.png
        resource/ph_camera.png
        resource/move.png
        resource/rotate.png
        resource/heading.png
        resource/battery.png
)
target_include_directories(DronePlugin
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
)
target_link_libraries(DronePlugin
    PRIVATE
        RoniaKit
        RoniaKitplugin
)
