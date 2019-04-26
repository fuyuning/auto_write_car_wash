from robot_car_wash_app_library.common import CommonLibrary


class WashTagLibrary(CommonLibrary):
    def get_car_wash_wash_tags(self):
        url = "{SERVER_DOMAIN}/car_wash/wash_tags".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

