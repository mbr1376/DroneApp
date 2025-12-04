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
## slove ubuntu




# Copy the built QML module directory (Drone) next to the executable at build
# time so the QML engine can find it without requiring environment vars while
# developing / running from the build tree.
## Ensure the Drone plugin target is built before copying the module
add_dependencies(DroneExample DronePlugin)

# Copy after build so the plugin shared libraries exist (avoid empty files)
add_custom_command(TARGET DroneExample POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_BINARY_DIR}/Drone
        $<TARGET_FILE_DIR:DroneExample>/Drone
)

# Install the built QML module to the standard qml import location so that
# 'make install' places Drone/qmldir into
# ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/qt6/qml/Drone
install(DIRECTORY ${CMAKE_BINARY_DIR}/Drone
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml
)
