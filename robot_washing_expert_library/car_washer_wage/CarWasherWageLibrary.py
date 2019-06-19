from robot_washing_expert_library.common import CommonLibrary


class CarWasherWageLibrary(CommonLibrary):
    def get_car_wash_car_washer_wage_achievement(self):
        url = "{SERVER_DOMAIN}/car_wash/car_washer_wage/achievement".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

