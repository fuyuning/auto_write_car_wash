from robot_car_wash_server_library.common import CommonLibrary


class CarPositionLibrary(CommonLibrary):
    def post_car_wash_car_positions(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_positions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "wash_area_id", "parking_id", "entry_time", "lon", "lat", "phase", "floor", "zone", "space_no"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_car_wash_car_positions(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_positions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_ids", "parking_id", "wash_area_id"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_car_wash_new_car_positions(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/new_car_positions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("parking_id", "wash_area_id", "section"):
                data[k] = v
        return self.client.get(url, params=data)

