import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager

Rectangle {
    id: mainMenu
    z: 1
    anchors.fill: parent
    Column {
        spacing: 10
        anchors.centerIn: parent
        width: 250
        height: 250
        BandyManager.MainMenuButton {
            text: "Nytt spel"
            onClicked: newGame.show()
        }

        BandyManager.MainMenuButton {
            text: "Ladda spel"
            onClicked: Qt.quit()
        }

        BandyManager.MainMenuButton {
            text: "Credits"
            onClicked: credits.show()
        }

        BandyManager.MainMenuButton {
            text: "Avsluta"
            onClicked: Qt.quit()
        }
    }

    function show() {
        visible = true;
    }

}
