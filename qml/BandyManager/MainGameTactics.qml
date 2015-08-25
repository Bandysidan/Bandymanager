import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager

Rectangle {
    id:mainGameTactics
    z: 20
    anchors.fill: parent
    Text{ text: "Taktik för nästa match" }


    function show() {
        mainGameTactics.visible = true;
    }


    function hide() {
        mainGameTactics.visible = false;
    }
}
