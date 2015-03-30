project(scriptedhtml)
 
find_package(KDE4 REQUIRED)
 
include(KDE4Defaults)
 
install(DIRECTORY scriptedimage/
        DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/scriptedimage)
 
install(FILES scriptedimage/metadata.desktop
        DESTINATION ${SERVICES_INSTALL_DIR} RENAME plasma-applet-scriptedhtml.desktop)
