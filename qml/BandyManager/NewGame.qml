import QtQuick 2.0

import linkan.bandymanager 1.0

Rectangle {
    id: newGame
    anchors.fill: parent
    z: 5
    property var iCountry: 1
    property var currentCountry: "sweden"

    Text {
        id: bandy
        text: qsTr("BandyManager")
        font.pointSize: 75
        x: 10
        y: 10
    }

    Countries {

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
        Country {
            id: country
        }

        Image {
            id: flag
            x: 100
            y: 170
            width: 235
            height: 142
            fillMode: Image.PreserveAspectFit
            Component.onCompleted: {
                source = country.getFlagByUid(currentCountry);
            }
        }
        Text {
            id: countryname
            x: 100
            y: 315
            Component.onCompleted: {
                text = country.getNameByUid(currentCountry);
            }
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

                onClicked:{
                    countryRight();
                    changeCountry();
                }

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
                onClicked:{
                    countryLeft();
                    changeCountry();
                }
            }
        }

    function show() {
        newGame.visible = true;

    }

    function countryRight() {
        if(currentCountry=="sweden")
               currentCountry="russia"
        else if(currentCountry=="russia")
            currentCountry="finland"
        else if(currentCountry=="finland")
            currentCountry="norway"
        else if(currentCountry=="norway")
            currentCountry="usa"
        else
            currentCountry="sweden"
//currentCountry = country.getNextByUid(currentCountry);
    }

    function countryLeft() {
        if(currentCountry=="sweden")
               currentCountry="usa"
        else if(currentCountry=="usa")
            currentCountry="norway"
        else if(currentCountry=="norway")
            currentCountry="finland"
        else if(currentCountry=="finland")
            currentCountry="russia"
        else
            currentCountry="sweden"

    }

    function changeCountry() {
        flag.source= country.getFlagByUid(currentCountry);
        countryname.text= country.getNameByUid(currentCountry);

    }


}
