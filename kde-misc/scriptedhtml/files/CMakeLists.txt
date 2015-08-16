project(scriptedhtml)
 
find_package(KDE4 REQUIRED)
 
include(KDE4Defaults)
 
install(DIRECTORY scriptedhtml/
        DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/scriptedhtml)
 
install(FILES scriptedhtml/metadata.desktop
        DESTINATION ${SERVICES_INSTALL_DIR} RENAME plasma-applet-scriptedhtml.desktop)
