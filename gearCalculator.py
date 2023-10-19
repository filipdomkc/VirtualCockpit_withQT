# This Python file uses the following encoding: utf-8


class gearCalculator:

    def __init__(self, tire_circumference_mm, gear_ratios, final_drive_ratio, reverse_ratio):
        self.speed = 0
        self.rpm = 0
        self.tire_circumference_mm = tire_circumference_mm
        self.gear_ratios = gear_ratios
        self.final_drive_ratio = final_drive_ratio
        self.reverse_ratio = reverse_ratio
        self.final_ratios = [round(x * self.final_drive_ratio, 2) for x in self.gear_ratios]

    def update_speed_rpm (self, speed, rpm):
        self.speed = speed
        self.rpm = rpm

    def calculate_current_gear(self):

        # Calculate approx current gear ratio from speed, rpm and tire circumference
        r_i = (60 * self.tire_circumference_mm * self.rpm)/(1000 * (self.speed + 0.00001))

        # Determine the current gear
        current_gear = None

        for gear, ratio in enumerate(self.final_ratios, start=0):

            if (0.97 * ratio) < r_i < (1.03 * ratio):
                current_gear = gear
                break

            else:
                current_gear = 7

        return current_gear

