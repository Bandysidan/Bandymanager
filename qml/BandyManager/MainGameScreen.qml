import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    z:20
 anchors.fill: parent
    Image {
        id: logo
        x: 110
        y: 10
        width: 235
        height: 142
        fillMode: Image.PreserveAspectFit
        source: "BMlogo.png"
    }
    function show() {
       // newGame.visible = false;
        mainGameScreen.visible = true;
    }

}
