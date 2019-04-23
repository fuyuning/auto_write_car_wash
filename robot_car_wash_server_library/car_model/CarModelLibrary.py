from robot_car_wash_server_library.common import CommonLibrary


class CarModelLibrary(CommonLibrary):
    def get_admin_car_models(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_models".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_brand", "car_series", "car_scale", "car_model", "is_car_model", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_car_models_by_car_model_id(self, car_model_id):
        url = "{SERVER_DOMAIN}/admin/car_models/{car_model_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_model_id=car_model_id)
        return self.client.get(url)

    def get_admin_car_model_count(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_model_count".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_brand", "car_series", "car_scale", "car_model", "is_car_model"):
                data[k] = v
        return self.client.get(url, params=data)

