import QtQuick 2.0

import "qrc:///qml/BandyManager" as BandyManager

Rectangle {
    id:mainGameHome
    z: 10
    anchors.fill: parent
    Text{ text: "Hem" }


    function show() {
        mainGameHome.visible = true;
    }


    function hide() {
        mainGameHome.visible = false;
    }
}


