from robot_car_wash_server_library.common import CommonLibrary


class CarInfoLibrary(CommonLibrary):
    def get_car_wash_car_infos(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_infos".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_ids", ):
                data[k] = v
        return self.client.get(url)

