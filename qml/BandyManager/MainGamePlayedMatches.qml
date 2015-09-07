import QtQuick 2.0

Rectangle {

    id:mainGamePlayedMatches
    z:20
    anchors.fill: parent

    Item{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20 // Sets all margins at once
        Column {
            Text {
                id: matchListHeadline
                text: "Elitserien"
                font.bold: true
                font.pointSize: 16
            }
            Text {
                id: matchList
                text: "Test"
            }
        }

    }


    function show() {
        mainGamePlayedMatches.visible = true;
    }
    function hide() {
        mainGamePlayedMatches.visible = false;
    }

}
