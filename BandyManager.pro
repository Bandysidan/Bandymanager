# Add more folders to ship with the application, here
folder_01.source = qml/BandyManager
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    country.cpp \
    team.cpp \
    player.cpp \
    gamer.cpp \
    match.cpp \
    game.cpp \
    serie.cpp \
    generalfunctions.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    main.qrc

OTHER_FILES += \
    qml/BandyManager/SplashScreen.qml \
    qml/BandyManager/Countries.qml \
    qml/BandyManager/Gamers.qml \
    qml/BandyManager/MatchPlay.qml \
    qml/BandyManager/MatchTactic.qml \
    qml/BandyManager/MatchShirt.qml

HEADERS += \
    country.h \
    team.h \
    player.h \
    gamer.h \
    match.h \
    game.h \
    serie.h \
    generalfunctions.h
