from robot_car_wash_app_library.common import CommonLibrary


class CarWasherLibrary(CommonLibrary):
    def get_car_wash_promoter_qrcode(self):
        url = "{SERVER_DOMAIN}/car_wash/promoter_qrcode".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

