import QtQuick 2.15
import QtQuick.Timeline 1.0

Item {
    id: speedometer
    width: 457
    height: 407
    property string currTime: currTime

    Text {
        id: km_h
        x: 212
        y: 235
        width: 51
        height: 24
        color: "#FF0000"
        text: qsTr("km/h")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget
        x: 228
        y: 381
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
        id: gadget1
        x: 117
        y: 354
        width: 40
        height: 26
        color: "#FFFFFF"
        text: qsTr("30")
        font.pixelSize: 37
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget2
        x: 40
        y: 283
        width: 41
        height: 26
        color: "#FFFFFF"
        text: qsTr("60")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget3
        x: -1
        y: 175
        width: 41
        height: 38
        color: "#ffffff"
        text: qsTr("90")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget4
        x: 24
        y: 83
        width: 62
        height: 26
        color: "#FFFFFF"
        text: qsTr("120")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget5
        x: 107
        y: 16
        width: 62
        height: 26
        color: "#FFFFFF"
        text: qsTr("150")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget6
        x: 207
        y: -7
        width: 62
        height: 26
        color: "#FFFFFF"
        text: qsTr("180")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget7
        x: 314
        y: 18
        width: 61
        height: 26
        color: "#FFFFFF"
        text: qsTr("210")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget8
        x: 397
        y: 89
        width: 61
        height: 26
        color: "#FFFFFF"
        text: qsTr("240")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }

    Text {
        id: gadget9
        x: 200
        y: 161
        width: 86
        height: 59
        color: "#FFFFFF"
        text: currTime
        font.pixelSize: 56
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
    }


}
