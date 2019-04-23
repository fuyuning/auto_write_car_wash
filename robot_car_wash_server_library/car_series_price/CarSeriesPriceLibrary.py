from robot_car_wash_server_library.common import CommonLibrary


class CarSeriesPriceLibrary(CommonLibrary):
    def get_admin_car_series_prices(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_series_prices".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("intelligent_service_id", "car_brand_name", "car_series_name", "car_scale", "car_model", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

