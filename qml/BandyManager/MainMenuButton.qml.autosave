
import QtQuick 2.0

Rectangle {
    id: button
    width: 250
    height: 32
    border.color: "#000000"
    border.width: 3


    signal clicked()

    property string text: ""

    Text {
        text: button.text
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: button.clicked()
        onEntered: {
            border.color= "#FF0000";
        }

        onExited: {
            border.color= "#000000";
        }
    }




}
