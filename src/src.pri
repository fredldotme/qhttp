QT       += core network
QT       -= gui

# Qt5.5.1 on OSX needs both c++11 and c++14!! the c++14 is not enough
CONFIG  += c++11 c++14

win32 {
    DEFINES += _WINDOWS WIN32_LEAN_AND_MEAN NOMINMAX
}

DEFINES       *= QHTTP_MEMORY_LOG=0
win32:DEFINES *= QHTTP_EXPORT

# Joyent http_parser
SOURCES  += $$PWD/../3rdparty/http-parser/http_parser.c
HEADERS  += $$PWD/../3rdparty/http-parser/http_parser.h

SOURCES  += \
    $$PWD/qhttpabstracts.cpp \
    $$PWD/qhttpserverconnection.cpp \
    $$PWD/qhttpserverrequest.cpp \
    $$PWD/qhttpserverresponse.cpp \
    $$PWD/qhttpserver.cpp

HEADERS  += \
    $$PWD/qhttpfwd.hpp \
    $$PWD/qhttpabstracts.hpp \
    $$PWD/qhttpserverconnection.hpp \
    $$PWD/qhttpserverrequest.hpp \
    $$PWD/qhttpserverresponse.hpp \
    $$PWD/qhttpserver.hpp

contains(DEFINES, QHTTP_HAS_CLIENT) {
    SOURCES += \
        qhttpclientrequest.cpp \
        qhttpclientresponse.cpp \
        qhttpclient.cpp

    HEADERS += \
        qhttpclient.hpp \
        qhttpclientresponse.hpp \
        qhttpclientrequest.hpp
}
