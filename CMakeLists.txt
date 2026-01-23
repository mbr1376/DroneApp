cmake_minimum_required(VERSION 3.16)
project(DroneProject LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Qml Quick)

add_subdirectory(Drone)
add_subdirectory(ThirdParty/RoniaKit)
#add_subdirectory(examples/simple)

