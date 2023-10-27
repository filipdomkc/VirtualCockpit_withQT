import QtQuick 2.15
import QtQuick.Timeline 1.0

Item {
    id: speedometer
    width: 457
    height: 407

    property string bmwfont: "BMW Helvetica 75"
    property var backend: undefined

    function calculateFontSize(speed) {

        if (currSpeed >= (speed-10) && currSpeed < speed) {
            return 25 + (currSpeed - (speed-10)) * 2; // Increase font size from 25 to 45
        } else if (currSpeed >= speed && currSpeed < (speed+10)) {
            return 45 - (currSpeed - speed) * 2; // Decrease font size from 45 to 25
        } else {
            return 25; // Default size
        }
    }

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
        font.family: bmwfont
    }

    Text {
        id: gadget
        x: 228
        y: 381
        width: 20
        height: 26
        color: currSpeed === "0" ? "#FFA500" : "#ffffff"
        text: qsTr("0")
        font.pixelSize: calculateFontSize(0)
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
        color: currSpeed === "30" ? "#FFA500" : "#ffffff"
        text: qsTr("30")
        font.pixelSize: calculateFontSize(30)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget2
        x: 40
        y: 283
        width: 41
        height: 26
        color: currSpeed === "60" ? "#FFA500" : "#ffffff"
        text: qsTr("60")
        font.pixelSize: calculateFontSize(60)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget3
        x: -1
        y: 175
        width: 41
        height: 38
        color: currSpeed === "90" ? "#FFA500" : "#ffffff"
        text: qsTr("90")
        font.pixelSize: calculateFontSize(90)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget4
        x: 24
        y: 83
        width: 62
        height: 26
        color: currSpeed === "120" ? "#FFA500" : "#ffffff"
        text: qsTr("120")
        font.pixelSize: calculateFontSize(120)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget5
        x: 107
        y: 16
        width: 62
        height: 26
        color: currSpeed === "150" ? "#FFA500" : "#ffffff"
        text: qsTr("150")
        font.pixelSize: calculateFontSize(150)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget6
        x: 207
        y: -7
        width: 62
        height: 26
        color: currSpeed === "180" ? "#FFA500" : "#ffffff"
        text: qsTr("180")
        font.pixelSize: calculateFontSize(180)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget7
        x: 314
        y: 18
        width: 61
        height: 26
        color: currSpeed === "210" ? "#FF0000" : "#ffffff"
        text: qsTr("210")
        font.pixelSize: calculateFontSize(210)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }

    Text {
        id: gadget8
        x: 397
        y: 89
        width: 61
        height: 26
        color: currSpeed === "240" ? "#FF0000" : "#ffffff"
        text: qsTr("240")
        font.pixelSize: calculateFontSize(240)
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        font.family: bmwfont
    }
}
