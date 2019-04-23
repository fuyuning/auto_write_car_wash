from robot_car_wash_server_library.common import CommonLibrary


class WashAreaLibrary(CommonLibrary):
    def get_wash_areas(self):
        url = "{SERVER_DOMAIN}/wash_areas".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

