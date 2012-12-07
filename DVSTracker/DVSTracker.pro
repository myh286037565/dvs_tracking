TEMPLATE = app
CONFIG += console

QT       += core \
    network

INCLUDEPATH += \
    inc \
    inc/usbiolib

SOURCES += main.cpp \
    usbreader.cpp \
    camwidget.cpp \
    event.cpp \
    eventprocessor.cpp \
    dvs128interface.cpp \
    logger.cpp \
    transition.cpp \
    udpinterface.cpp \
    interval.cpp

HEADERS += \
    usbreader.h \
    stdafx.h \
    ringbuffer.h \
    camwidget.h \
    event.h \
    eventprocessor.h \
    eventprocessorbase.h \
    dvs128interface.h \
    logger.h \
    transition.h \
    udpinterface.h \
    interval.h \
    map.h



win32: LIBS += -L$$PWD/inc/usbiolib/Debug/Win32/ -lusbiolib

INCLUDEPATH += $$PWD/inc/usbiolib/Debug/Win32
DEPENDPATH += $$PWD/inc/usbiolib/Debug/Win32

win32: PRE_TARGETDEPS += $$PWD/inc/usbiolib/Debug/Win32/usbiolib.lib
