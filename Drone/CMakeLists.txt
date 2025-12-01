cmake_minimum_required(VERSION 3.16)

project(DronePlugin VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Qml)

qt_add_qml_module(DronePlugin
    URI DronePlugin
    VERSION 1.0
    QML_FILES
    DroneItem.qml
)
