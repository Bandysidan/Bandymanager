import QtQuick 2.0

Rectangle {
    id: splashScreen
    anchors.fill: parent

    signal done()

    Text {
        id: bandy
        text: qsTr("Version: 0.1.0-preAlpha")
        font.pointSize: 25
        x: 10
        y: 10
    }

    Image {
        id: splashImage
        anchors.centerIn: parent
        fillMode: Image.Stretch
        source: "BMlogo.png"
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
        properties: "opacity"
        from: 1
        to: 0
        duration: 500
        onStopped: {
            splashScreen.visible = false;
            done();
        }
    }
}
