from robot_washing_expert_library.common import CommonLibrary


class CarSeriesLibrary(CommonLibrary):
    def get_car_wash_car_series(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_series".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("brand_id", "car_series_name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_car_wash_car_series_money(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_series/money".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("series_id", "parking_id"):
                data[k] = v
        return self.client.get(url, params=data)

