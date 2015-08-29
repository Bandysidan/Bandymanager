import QtQuick 2.0

Item {
    id:matchShirt
    height: 100
    width: 100
    signal clicked()

    property string text: ""
    property string shirt: "shirts/ShirtNonchoosen.png"
    property int pos
    Column {
        anchors.top: parent.Top
        Image {
            id:shirtImage
            height: 81
            width: 59
            source: matchShirt.shirt
        }
        Text {
            id: shirtText
            text: matchShirt.text
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
        }

    }

}
