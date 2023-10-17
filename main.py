# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path
from time import strftime, localtime
import random
from PySide6.QtCore import QTimer, QObject, Signal
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

class Backend(QObject):

    updated = Signal(str, arguments=['time'])
    updatedSpeed = Signal(int, arguments=['speed'])

    def __init__(self):
        super().__init__()

        # Define timer.
        self.timer = QTimer()
        self.timer.setInterval(100)  # msecs 100 = 1/10th sec
        self.timer.timeout.connect(self.update_time)
        self.timer.start()
        self.timer.timeout.connect(self.update_speed)
        self.timer.start()

    def update_time(self):
        # Pass the current time to QML.
        curr_time = strftime("%H:%M", localtime())
        self.updated.emit(curr_time)

    def update_speed(self):
        # Pass the current speed to QML.
        curr_speed = random.randint(0, 240)
        self.updatedSpeed.emit(curr_speed)

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

    sys.exit(app.exec())
