# This Python file uses the following encoding: utf-8
import sys
import obd
import random
from pathlib import Path
from time import strftime, localtime
from gearCalculator import gearCalculator
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QTimer, QObject, Signal

class Backend(QObject):

    updated = Signal(str, arguments=['time'])
    updatedSpeed = Signal(int, arguments=['speed'])
    updatedRpm = Signal(int, arguments=['rpm'])
    updatedGear = Signal(int, arguments=['gear'])
    updatedFuelLevel = Signal(int, arguments=['fuel_level'])

    def __init__(self):
        super().__init__()
        self.curr_speed = 0
        self.curr_rpm = 0
        self.tire_circumference = 1.935
        self.gear_ratios = [3.54, 3.92, 2.13, 1.27, 0.92, 0.75, 0.63]
        self.final_drive = 3.39

        self.gear = gearCalculator (self.tire_circumference, self.gear_ratios, self.final_drive, 3.54)
        """
        # Initialize the OBD connection
        self.obd_connection = obd.Async()
        self.obd_connection.watch(obd.commands.RPM, callback = self.update_rpm)
        self.obd_connection.watch(obd.commands.SPEED, callback = self.update_speed)
        self.obd_connection.start()
        """

        # Define timer.
        self.timer = QTimer()
        self.timer.setInterval(100)  # msecs 100 = 1/10th sec
        self.timer.timeout.connect(self.update_time)
        self.timer.timeout.connect(self.update_speed)
        self.timer.timeout.connect(self.update_rpm)
        self.timer.timeout.connect(self.update_current_gear)
        self.timer.timeout.connect(self.update_fuel_level)
        self.timer.start()

    def update_time(self):
        # Pass the current time to QML.
        curr_time = strftime("%H:%M", localtime())
        self.updated.emit(curr_time)

    def update_speed(self,speed=None):
        if speed is None:
            # Pass the current speed to QML.
            self.curr_speed = random.randint(0, 240) #mock data
        else:
            self.curr_speed = speed #data coming from obd connection

        self.updatedSpeed.emit(self.curr_speed)

    def update_rpm(self, rpm = None):
        if rpm is None:
            # Pass the current speed to QML.
            self.curr_rpm = random.randint(0, 8000)
        else:
            self.curr_rpm = rpm #data coming from obd connection

        self.updatedRpm.emit(self.curr_rpm)

    def update_current_gear(self):
        self.gear.update_speed_rpm(self.curr_speed, self.curr_rpm)
        self.curr_gear = self.gear.calculate_current_gear()
        print(self.curr_gear)
        self.updatedGear.emit(self.curr_gear)

    def update_fuel_level(self,fuel_level=None):
        if fuel_level is None:
            # Pass the current speed to QML.
            self.curr_fuel_level = 26 #mock data
        else:
            self.curr_fuel_level = fuel_level #data coming from obd connection

        self.updatedFuelLevel.emit(self.curr_fuel_level)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    qml_file = Path(__file__).resolve().parent / "qml/main.qml"

    backend = Backend()

    engine.load(qml_file)
    engine.rootObjects()[0].setProperty('backend', backend)

    if not engine.rootObjects():
        sys.exit(-1)

    backend.update_time()
    backend.update_speed()
    backend.update_rpm()
    backend.update_current_gear()
    backend.update_fuel_level()

    sys.exit(app.exec())
