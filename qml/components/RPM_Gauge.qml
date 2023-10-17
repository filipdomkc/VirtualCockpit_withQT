import QtQuick 2.15

Item {
    id: rpm
    width: 379
    height: 404

    property int rpmValue: 0

    Text {
        id: gadget
        x: 105
        y: 165
        width: 130
        height: 59
        color: "#FFFFFF"
        text: qsTr(rpmValue.toString())
        font.pixelSize: 56
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: rpm1
        x: 158
        y: 231
        width: 40
        height: 30
        color: "#FF0000"
        text: qsTr("rpm")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget1
        x: 168
        y: 378
        width: 20
        height: 26
        color: "#FFFFFF"
        text: qsTr("0")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget2
        x: 265
        y: 348
        width: 16
        height: 26
        color: "#FFFFFF"
        text: qsTr("1")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget3
        x: 335
        y: 277
        width: 21
        height: 26
        color: "#FFFFFF"
        text: qsTr("2")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget4
        x: 359
        y: 181
        width: 21
        height: 26
        color: "#FFFFFF"
        text: qsTr("3")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget5
        x: 335
        y: 89
        width: 20
        height: 26
        color: "#FFFFFF"
        text: qsTr("4")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget6
        x: 264
        y: 17
        width: 21
        height: 26
        color: "#FFFFFF"
        text: qsTr("5")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget7
        x: 168
        y: -7
        width: 20
        height: 26
        color: "#FFFFFF"
        text: qsTr("6")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget8
        x: 69
        y: 17
        width: 22
        height: 26
        color: "#FFFFFF"
        text: qsTr("7")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget9
        x: -1
        y: 86
        width: 21
        height: 26
        color: "#FFFFFF"
        text: qsTr("8")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

}
