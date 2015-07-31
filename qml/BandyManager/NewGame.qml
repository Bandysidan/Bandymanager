import QtQuick 2.0

Rectangle {
    id: newGame
    anchors.fill: parent
    z: 5
    Text {
        id: bandy
        text: qsTr("BandyManager")
        font.pointSize: 75
        x: 10
        y: 10
    }

    Text {
        id: namn
        text: qsTr("Ditt namn")
        x: 10
        y: 130
    }

        TextInput {
            x: 100
            y: 130
            id: input
            color: "red"
            text: "Inqognito"
            width: parent.width-16; height: 28
            focus: true
        }
        Image {
            id: flag
            x: 100
            y: 170
            width: 235
            height: 142
            fillMode: Image.PreserveAspectFit
            source: "Sweden.png"
        }

        Image {
            id: right
            x: 355
            y: 225
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
            source: "Right.png"
        }

    function show() {
        newGame.visible = true;

    }


}
