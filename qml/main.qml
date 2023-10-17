import QtQuick 2.15
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15
import "components"

Window {
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
                    sweepAngle: 240
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
                    sweepAngle: -240
                }
            }
        }
    }

    Frame {
        x: 0
        y: 76
    }

    Driving_Mode_Graphic{
        x: 554
        y: 315
    }

    RPM_Gauge { x: 800;y: 158}

    Speed_Gauge { x: 48;y: 157; currTime: currTime}

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: -434
        anchors.bottomMargin: 110
        anchors.leftMargin: 434
        anchors.topMargin: -110
        color: "transparent"


        Text {
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
            y: 436
            anchors {
                bottom: parent.bottom
                bottomMargin: 221
                left: parent.left
                leftMargin: -164
            }
            text: currSpeed
            font.styleName: "Bold"
            font.family: "BMW Helvetica 75"
            font.pixelSize: 50
            color: "white"
        }

    }

    Connections {
        target: backend

        function onUpdated(msg) {
            currTime = msg;
        }

        function onUpdatedSpeed(msg2) {
            currSpeed = msg2;
        }
    }

}
