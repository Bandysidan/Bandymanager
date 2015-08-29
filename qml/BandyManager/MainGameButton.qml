import QtQuick 2.0

Rectangle {
    id: button
    width: 100
    height: 28
    radius: 4 // This gives rounded corners to the Rectangle
            gradient: Gradient { // This sets a vertical gradient fill
                GradientStop { position: 0.0; color: "lime" }
                GradientStop { position: 1.0; color: "olive" }
            }
            border { width: 1; color: "white" }


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
            gradient.GradientStop.color = "FF0000";
        }

        onExited: {
            border.color= "white";
        }
    }


    function show() {
        button.visible=true;
    }
    function hide() {
        button.visible=false;
    }

}

