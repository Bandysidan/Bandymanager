import QtQuick 2.0

Rectangle {
    id:tacticShirt
    height: 100
    width: 100
    color: "#cccccc"
 //   opacity: 0
    signal clicked()

    property string text: ""
    property string shirt: "ShirtNonchoosen.png"
    Column {
        anchors.top: parent.Top
        Image {
            id:shirtImage
            height: 81
            width: 59
          //  opacity: 1
            source: tacticShirt.shirt
        }
        Text {
            id: shirtText
            text: tacticShirt.text
        }
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            shirtImage.opacity=0.1;
        }
        onExited: {
            shirtImage.opacity=1;
        }

        onClicked:{

            tacticShirt.text=player.getShortNameByUid(currentPlayer);
            tacticShirt.shirt="ShirtRed.png"
        }

    }

}

