cmake_minimum_required(VERSION 3.3)
project(webslice)

find_package(ECM 0.0.11 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)
include(KDECMakeSettings)

install(DIRECTORY cqcb.plasma.webslice/
        DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/cqcb.plasma.webslice)
 
install(FILES cqcb.plasma.webslice/metadata.desktop
        DESTINATION ${SERVICES_INSTALL_DIR} RENAME plasma-applet-webslice.desktop)
