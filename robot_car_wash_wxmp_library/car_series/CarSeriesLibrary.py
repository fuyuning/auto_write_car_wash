from robot_car_wash_wxmp_library.common import CommonLibrary


class CarSeriesLibrary(CommonLibrary):
    def get_car_series(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_series".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("brand_id", "car_series_name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

