cmake_minimum_required(VERSION 3.16)

project(DroneExample LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Qml Quick)

qt_add_executable(DroneExample
    main.cpp
)

qt_add_qml_module(DroneExample
    URI test
    VERSION 1.0
    QML_FILES main.qml
)
target_link_libraries(DroneExample
    PRIVATE Qt6::Qml Qt6::Quick DronePlugin
)



include(GNUInstallDirs)
install(TARGETS DroneExample
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
