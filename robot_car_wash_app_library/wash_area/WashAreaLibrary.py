from robot_car_wash_server_library.common import CommonLibrary


class WashAreaLibrary(CommonLibrary):
    def get_car_wash_wash_areas(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/wash_areas".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", "condition"):
                data[k] = v
        return self.client.get(url, params=data)

