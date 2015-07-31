import QtQuick 2.0

Rectangle {
    id: newGame
    anchors.fill: parent
    z: 5
    property var iCountry: 1
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
            signal clicked()
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
//                onClicked: button.clicked()
                onEntered: {
                    right.source= "RightOMO.png";
                }

                onExited: {
                    right.source= "Right.png";
                }
                onClicked: countryRight()
            }
        }


        Image {
            id: left
            x: 55
            y: 225
            width: 32
            height: 32
            fillMode: Image.PreserveAspectFit
            source: "Left.png"
            signal clicked()
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
//                onClicked: button.clicked()
                onEntered: {
                    left.source= "LeftOMO.png";
                }

                onExited: {
                    left.source= "Left.png";
                }
                onClicked: countryLeft()
            }
        }

    function show() {
        newGame.visible = true;

    }

    function countryRight() {
        iCountry++;
        if (iCountry==6) iCountry=1;
        if (iCountry==1) flag.source= "Sweden.png";
        else if (iCountry==2) flag.source= "Russia.png";
        else if (iCountry==3) flag.source= "Finland.png";
        else if (iCountry==4) flag.source= "Norway.png";
        else if (iCountry==5) flag.source= "USA.png";


    }

    function countryLeft() {
        iCountry--;
        if (iCountry==0) iCountry=5;
        if (iCountry==1) flag.source= "Sweden.png";
        else if (iCountry==2) flag.source= "Russia.png";
        else if (iCountry==3) flag.source= "Finland.png";
        else if (iCountry==4) flag.source= "Norway.png";
        else if (iCountry==5) flag.source= "USA.png";

    }


}
