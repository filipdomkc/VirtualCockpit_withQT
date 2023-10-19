# This Python file uses the following encoding: utf-8


class gearCalculator:

    def __init__(self, tire_circumference_mm, gear_ratios, final_drive_ratio, reverse_ratio):
        self.tire_circumference_mm = tire_circumference_mm
        self.gear_ratios = gear_ratios
        self.final_drive_ratio = final_drive_ratio
        self.reverse_ratio = reverse_ratio
        self.final_ratios = [round(x * self.final_drive_ratio, 2) for x in self.gear_ratios]

    def calculate_current_gear(self, speed_kph, rpm):

        # Calculate approx current gear ratio from speed, rpm and tire circumference
        r_i = (60 * self.tire_circumference_mm * rpm)/(1000 * speed_kph)

        # Determine the current gear
        current_gear = None

        for gear, ratio in enumerate(self.final_ratios, start=0):

            if (0.97 * ratio) < r_i < (1.03 * ratio):
                current_gear = gear

                if current_gear == 0:
                    current_gear = "R"
                    break

                break
            else:
                current_gear = None

        if current_gear is None:
            return "N" # Neutral or unknown gear

        return current_gear

