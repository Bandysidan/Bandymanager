import QtQuick 2.0
import "qrc:///qml/BandyManager" as BandyManager

Rectangle {
    id:mainGameSquad
    z:15

        anchors.fill: parent
        Text{ text: "Truppen" }


        function show() {
            mainGameSquad.visible = true;
        }


        function hide() {
            mainGameSquad.visible = false;
        }
}
