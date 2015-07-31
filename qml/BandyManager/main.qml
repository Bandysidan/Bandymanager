import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.1
import "qrc:///qml/BandyManager" as BandyManager

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
//    visibility: "Maximized"
    BandyManager.SplashScreen {
        onDone: {
            mainMenu.show()
        }
    }
    BandyManager.MainMenu {
        id: mainMenu
        visible: false
    }
    BandyManager.Credits {
        id: credits
        visible: false
    }
    BandyManager.NewGame {
        id: newGame
        visible: false
    }
}
