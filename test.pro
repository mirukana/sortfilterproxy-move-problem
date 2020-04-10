QT        = quick quickcontrols2 widgets
DEFINES  += QT_DEPRECATED_WARNINGS
CONFIG   += debug qml_debug declarative_debug
TEMPLATE  = app

BUILD_DIR   = build
MOC_DIR     = $$BUILD_DIR/moc
OBJECTS_DIR = $$BUILD_DIR/obj
RCC_DIR     = $$BUILD_DIR/rcc

SOURCES += src/main.cpp
TARGET   = test

include(submodules/SortFilterProxyModel/SortFilterProxyModel.pri)
