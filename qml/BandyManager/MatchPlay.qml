import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager
import linkan.bandymanager 1.0
import team.bandymanager 1.0
import players.bandymanager 1.0

Rectangle {
    id: matchPlay
    z:25
    anchors.fill: parent

    function show() {
        matchPlay.visible = true;
    }

    function hide() {
        matchPlay.visible = false;
    }

}
