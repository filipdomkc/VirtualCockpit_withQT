import QtQuick 2.15

Item {
    id: driving_mode_graphic
    width: 144
    height: 26

    Text {
        id: sport_
        x: -1
        y: -9
        width: 146
        height: 35
        color: "#FF0000"
        text: qsTr("SPORT+")
        font.pixelSize: 34
        horizontalAlignment: Text.AlignLeft
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

}
