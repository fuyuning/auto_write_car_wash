from robot_car_wash_server_library.common import CommonLibrary


class CarWasherLibrary(CommonLibrary):
    def get_car_wash_car_washer(self):
        url = "{SERVER_DOMAIN}/car_wash/car_washer".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

