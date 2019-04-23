from robot_car_wash_server_library.common import CommonLibrary


class CarSeriesLibrary(CommonLibrary):
    def get_admin_car_series(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_series".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_brand", "car_series_name", "car_scale", "car_model", "is_active", "is_car_model", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_car_series_by_car_series_id(self, car_series_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_series/{car_series_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_series_id=car_series_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_model_id", ):
                data[k] = v
        return self.client.put(url)

    def patch_admin_car_series_by_car_series_id(self, car_series_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_series/{car_series_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_series_id=car_series_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_active", ):
                data[k] = v
        return self.client.patch(url)

