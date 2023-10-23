import QtQuick 2.15
import QtQuick.Window
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15
import "components"

Window {
    id: digital_cluster
    width: 1280
    height: 720
    maximumHeight : 720
    maximumWidth : 1280
    minimumHeight : 720
    minimumWidth : 1280
    visible: true
    color: "#000000"
    title: qsTr("MINI Coooper SD F56 Virtual Cockpit")

    property string currTime: "00:00"
    property string currSpeed: "0"
    property string currRpm: "0"
    property string currGear: "7"
    property string currFuelLevel: "25"
    property QtObject backend

    Item {
        id: progress
        implicitWidth: 550
        implicitHeight: 550

        // Properties
        // General
        property bool roundCap: true
        property int startAngle: 0
        property real maxValue: 100
        property real value: 50
        property int samples: 12
        // Progress Circle
        property color progressColor: "#FF0000"
        property int progressWidth: 55
        // Text
        property string text: "%"
        property bool textShowValue: true
        property string textFontFamily: "Segoe UI"
        property int textSize: 12
        property color textColor: "#7c7c7c"
        x: 17
        y: 85

        Shape {
            id: shapeSpeed
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            layer.samples: progress.samples

            ShapePath {
                id: path
                strokeColor: progress.progressColor
                fillColor: "transparent"
                strokeWidth: progress.progressWidth

                PathAngleArc {
                    radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                    radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                    centerX: progress.width / 2
                    centerY: progress.height / 2
                    startAngle: 90
                    sweepAngle: currSpeed
                }
            }
        }
    }

    Item {
        id: rpm_progress
        implicitWidth: 550
        implicitHeight: 550

        // Properties
        // General
        property bool roundCap: true
        property int startAngle: 0
        property real maxValue: 100
        property real value: 50
        property int samples: 12
        // Progress Circle
        property color progressColor: "#FF0000"
        property int progressWidth: 55
        // Text
        property string text: "%"
        property bool textShowValue: true
        property string textFontFamily: "Segoe UI"
        property int textSize: 12
        property color textColor: "#7c7c7c"
        x: 573
        y: 109

        Shape {
            id: rpm_shapeSpeed
            anchors.fill: parent
            anchors.rightMargin: -113
            anchors.bottomMargin: 19
            anchors.leftMargin: 113
            anchors.topMargin: -19
            layer.enabled: true
            layer.samples: rpm_progress.samples

            ShapePath {
                id: rpm_path
                strokeColor: rpm_progress.progressColor
                fillColor: "transparent"
                strokeWidth: rpm_progress.progressWidth

                PathAngleArc {
                    radiusX: (rpm_progress.width / 2) - (rpm_progress.progressWidth / 2)
                    radiusY: (rpm_progress.height / 2) - (rpm_progress.progressWidth / 2)
                    centerX: rpm_progress.width / 2
                    centerY: rpm_progress.height / 2
                    startAngle: 90
                    sweepAngle: -currRpm/33
                }
            }
        }
    }

    Image {
        id: shade
        x: 4
        y: 76
        width: 554
        height: 554
        source: "components/assets/shade.png"
    }

    Image {
        id: shade2
        x: 713
        y: 83
        width: 554
        height: 554
        source: "components/assets/shade.png"
    }


    Frame {
        x: 0
        y: 76
    }

    Driving_Mode_Graphic{
        x: 554
        y: 392
    }

    RPM_Gauge { x: 800;y: 158}

    Speed_Gauge { x: 48;y: 157; backend: digital_cluster.backend}

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: -434
        anchors.bottomMargin: 110
        anchors.leftMargin: 434
        anchors.topMargin: -110
        color: "transparent"


        Text {
            id: time
            anchors {
                bottom: parent.bottom
                bottomMargin: 12
                left: parent.left
                leftMargin: 12
            }
            text: currTime
            font.styleName: "Bold"
            font.family: "BMW Helvetica 75"
            font.pixelSize: 24
            color: "white"
        }

    }

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: -434
        anchors.bottomMargin: 110
        anchors.leftMargin: 434
        anchors.topMargin: -110
        color: "transparent"


        Text {
            id: speed
            y: 436
            width: 106
            height: 63
            anchors {
                bottom: parent.bottom
                bottomMargin: 221
                left: parent.left
                leftMargin: -202
            }
            text: currSpeed
            font.styleName: "Bold"
            font.family: "BMW Helvetica 75"
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            color: "white"
        }
    }

    Text {
        id: currGearElement
        x: 606
        y: 231
        text: {
            if (currGear === "0")
                return "R";
            else if (currGear === "7")
                return "N";
            else
                return currGear;
        }
        font.styleName: "Bold"
        font.family: "Digital-7"
        font.pixelSize: 85
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }

    Text {
        id: currGear1
        x: 603
        y: 312
        color: "#ff0000"
        text: qsTr("GEAR")
        font.pixelSize: 15
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: fuelLevel
        x: 459
        y: 543
        color: "#ff0000"
        text: qsTr("FUEL LEVEL")
        font.pixelSize: 15
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: percent
        x: 526
        y: 508
        color: "#ffffff"
        text: qsTr("%")
        font.pixelSize: 20
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: fuelLevelValue
        x: 471
        y: 489
        color: "#ffffff"
        text: currFuelLevel
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: rangeValue
        x: 573
        y: 489
        color: "#ffffff"
        text: currFuelLevel/100*800
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: engineTempValue
        x: 692
        y: 489
        width: 71
        height: 51
        color: "#ffffff"
        text: qsTr("59")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: celsiusDegrees
        x: 770
        y: 508
        color: "#ffffff"
        text: qsTr("°C")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: kilometers
        x: 646
        y: 508
        color: "#ffffff"
        text: qsTr("km")
        font.pixelSize: 20
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: range
        x: 597
        y: 543
        color: "#ff0000"
        text: qsTr("RANGE")
        font.pixelSize: 15
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: engineTemp
        x: 687
        y: 543
        color: "#ff0000"
        text: qsTr("ENGINE TEMP")
        font.pixelSize: 15
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: rpm
        y: 329
        width: 114
        height: 63
        anchors {
            bottom: parent.bottom
            bottomMargin: 328
            left: parent.left
            leftMargin: 920
        }
        text: currRpm
        font.styleName: "Bold"
        font.family: "BMW Helvetica 75"
        font.pixelSize: 50
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }

    Text {
        id: temperature
        x: -9
        y: 568
        color: "#ffffff"
        text: "21 °C"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        font.pixelSize: 24
        anchors.leftMargin: 593
        anchors.bottomMargin: 121
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Text {
        id: milage
        x: -9
        y: 568
        color: "#ffffff"
        text: "200658km"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        font.pixelSize: 24
        anchors.leftMargin: 687
        anchors.bottomMargin: 121
        font.family: "BMW Helvetica 75"
        font.styleName: "Bold"
    }

    Row {
        id: row
        x: 426
        y: 599
        width: 400
        height: 45
        spacing: (row.width - (40 * 5)) / 4 // Calculate spacing

        Image {
            id: handbrake
            x: 0
            y: 0
            width: 40
            height: 40
            source: "components/assets/hand-brake-inactive.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: fuelpump
            x: 250
            y: 0
            width: 40
            height: 40
            source: currFuelLevel <= 15 ? "components/assets/fuel-pump(1).svg" : "components/assets/fuel-pump-inactive.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: checkengine
            x: 250
            y: 0
            width: 40
            height: 40
            source: "components/assets/engine-moto-inactive.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: coolanttemp
            x: 250
            y: 0
            width: 40
            height: 40
            source: "components/assets/engine-coolant-inactive.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
                id: tirepressure
                x: 250
                y: 0
                width: 40
                height: 40
                source: "components/assets/tire-pressure-inactive.svg"
                fillMode: Image.PreserveAspectFit
            }

        }

    Connections {
        target: backend

        function onUpdated(msg) {
            currTime = msg;
        }

        function onUpdatedSpeed(msg) {
            currSpeed = msg;
        }

        function onUpdatedRpm(msg) {
            currRpm = msg;
        }

        function onUpdatedGear(msg) {
            currGear = msg;
        }

        function onUpdatedFuelLevel(msg) {
            currFuelLevel = msg;
        }
    }

}

