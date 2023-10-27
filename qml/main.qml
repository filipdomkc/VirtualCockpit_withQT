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
        id:johnCooperWorks
        implicitWidth: 1280
        implicitHeight: 720
        visible: true

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
            x: 605
            y: 97
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
            x: 602
            y: 178
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

    }

    Item {
        id: bmw_m5
        implicitWidth: 1280
        implicitHeight: 720
        visible: false

        Image {
                id: bmw_background
                x: 0
                y: 0
                width: 1280
                height: 720
                source: "components/assets/bmw_background.png"
                fillMode: Image.PreserveAspectFit
            }

        Item {
            id: sport_speed_needle
            x: 346
            y: 334
            width: 51.5
            height: 51.5
            rotation: currSpeed/1.33

            Image {
                    id: bmw_speed_needle
                    x: -131
                    y: -36
                    source: "components/assets/bmw_needle_1.png"
                    fillMode: Image.PreserveAspectFit
                }
        }

        Item {
            id: sport_rpm_needle
            x: 922
            y: 334
            width: 51.5
            height: 51.5
            rotation: currRpm/25

            Image {
                    id: bmw_rpm_needle
                    x: -181
                    y: -37
                    source: "components/assets/bmw_needle_2_1.png"
                    fillMode: Image.PreserveAspectFit
                }

        }

        Item {
            id: sport_fuel_level_needle
            x: 108
            y: 415
            width:80
            height:91.2
            rotation: currFuelLevel/100*145


            Image {
                    id: bmw_fuel_needle
                    x: 0
                    y: 8
                    source: "components/assets/bmw_fuel_level_needle"
                    fillMode: Image.PreserveAspectFit
                }

        }

        Item {
            id: sport_oil_temp_needle
            x: 1135
            y: 421
            width:80
            height:91.2
            rotation: -70


            Image {
                    id: bmw_oil_needle
                    x: 0
                    y: 8
                    source: "components/assets/bmw_fuel_level_needle"
                    fillMode: Image.PreserveAspectFit
                }

        }

        Rectangle {
            x: 563
            y: 16
            width : 200
            height: 200
            visible: true
            color: "black"
        }


    }

    Item {
        id: mercedes_amg
        implicitWidth: 1280
        implicitHeight: 720
        visible: false

        Image {
                id: mercedes_background
                x: 0
                y: 0
                width: 1280
                height: 720
                source: "components/assets/MercedesAmgScreen.png"
                fillMode: Image.PreserveAspectFit
            }

        Item {
            id: normal_speed_needle
            x: 281
            y: 341
            width: 50
            height: 50
            rotation: currSpeed/1.33

            Image {
                    id: mercedes_needle_speed
                    x: -140
                    y: -91
                    source: "components/assets/MercedesAmgNeedle.png"
                    fillMode: Image.PreserveAspectFit
                }
        }

        Item {
            id: normal_rpm_needle
            x: 947
            y: 341
            width: 50
            height: 50
            rotation: currRpm/22.22

            Image {
                    id: mercedes_needle_rpm
                    x: -140
                    y: -91
                    source: "components/assets/MercedesAmgNeedle.png"
                    fillMode: Image.PreserveAspectFit
                }
        }





    }

    Tumbler {
        id: tumbler
        visible: true
        anchors.verticalCenterOffset: bmw_m5.visible?-155 : -10
         anchors.horizontalCenterOffset: bmw_m5.visible ? 52: 1
         anchors.centerIn: parent
         width: 139
         height: 203
         focus: true

         model: ListModel {
             ListElement{text: "ECO"; value: 0;}
             ListElement {text: "NORMAL"; value: 1; }
             ListElement {text: "SPORT+"; value: 2;}
         }

         delegate: RadioButton {
                 id:rd
                 checkable: true
                 text: model.text
                 focus: true
                 enabled: tumbler.currentIndex === model.value
                 font.pixelSize: tumbler.currentIndex === model.value ? 24 : 18
                 opacity: tumbler.currentIndex === model.value ? 1.0 : 0.5
                 onClicked: {
                     model.checked = !model.checked
                     if (tumbler.currentIndex === 0) {
                         // Set the visibility of another element to false
                         johnCooperWorks.visible = true
                         mercedes_amg.visible = false
                         bmw_m5.visible = false
                     }
                     if (tumbler.currentIndex === 1) {
                         // Set the visibility of another element to false
                         johnCooperWorks.visible = false
                         mercedes_amg.visible = true
                         bmw_m5.visible = false
                     }
                     if (tumbler.currentIndex === 2) {
                         // Set the visibility of another element to false
                         johnCooperWorks.visible = false
                         mercedes_amg.visible = false
                         bmw_m5.visible = true
                     }
                 }

                 indicator: Rectangle {
                     implicitWidth: 15
                     implicitHeight: 15
                     x: rd.leftPadding
                     anchors.verticalCenter: rd.verticalCenter
                     radius: 13
                     color: "black"
                     border.color: "red"

                     Rectangle {
                         width: 8
                         height: 8
                         x: 3.5
                         y: 3.5
                         radius: 4
                         color:  "red"
                         visible: rd.checked
                     }
                 }

                 contentItem: Text {
                     text: rd.text
                     font: rd.font
                     opacity: enabled ? 1.0 : 0.3
                     color:  "red"
                     verticalAlignment: Text.AlignVCenter
                     leftPadding: rd.indicator.width + rd.spacing
                 }
         }

         Keys.onPressed: {
          if (event.key === Qt.Key_Up){
             tumbler.currentIndex++;
             tumbler.visible = true
             visibilityTimer.start()
          }
          if (event.key === Qt.Key_Down){
             tumbler.currentIndex--;
             tumbler.visible = true;
             visibilityTimer.start()
          }
         }
     }

    Timer {
        id: visibilityTimer
        interval: 5000 // 5000 milliseconds (5 seconds)
        running: false
        onTriggered: {
            // Set the visibility of the element to 0 when the timer triggers
            tumbler.visible = false;
        }
    }

    Rectangle {
        id: welcome
        width: 1280
        height: 720
        color: "black"

        Image {
            id: jCW_old_logo
            x: 384
            y: 314
            width: 513
            height: 93
            source: "components/assets/JCW_old_logo.svg"
            fillMode: Image.PreserveAspectFit

            // Opacity animation
            NumberAnimation {
                id: opacityAnimation
                target: jCW_old_logo
                property: "opacity"
                from: 0
                to: 1
                duration: 2000 // 2 seconds
                easing.type: Easing.InQuad // Ease In
            }

            // Trigger the animation immediately when the component is completed
            Component.onCompleted: {
                opacityAnimation.start()
            }
        }

    Timer {
        id: visibilityWelcomeTimer
        interval: 3500 // 5000 milliseconds (5 seconds)
        running: true
        onTriggered: {
            // Set the visibility of the element to 0 when the timer triggers
            welcome.visible = false;
        }
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

