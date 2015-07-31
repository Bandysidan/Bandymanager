import QtQuick 2.0

Rectangle {
    id: credits
    anchors.fill: parent
    z: 5
    signal done()
    Column{
        Text {
            id: bandy
            text: qsTr("BandyManager")
            font.pointSize: 75
            x: 10
            y: 10
        }
        Text {
            text: "Detta spel är programmerat av Torbjörn Lindquist.\n\nFlaggorna i spelet är gjorda av Gang of the Coconuts http://www.free-country-flags.com/index.php\n\nSpelet är släppt under Creative Commons Attribution-ShareAlike 3.0 Unported"
            x: 10
            y:120
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            end.start();
        }
    }

    Image {
        id: bandysidanlogga
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 364
        height: 100
        fillMode: Image.PreserveAspectFit
        source: "logga.png"
    }

    PropertyAnimation {
        id: end
        target: bandy
        onStopped: {
            credits.visible = false;
            done();
        }
    }

    function show() {
        credits.visible = true;

    }


}
