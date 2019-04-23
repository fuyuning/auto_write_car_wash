from robot_car_wash_server_library.common import CommonLibrary


class ParkingLibrary(CommonLibrary):
    def get_parkings_nearby(self, **kwargs):
        url = "{SERVER_DOMAIN}/parkings/nearby".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_type", "radius", "center", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_parkings(self, **kwargs):
        url = "{SERVER_DOMAIN}/parkings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_type", "parking_name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

