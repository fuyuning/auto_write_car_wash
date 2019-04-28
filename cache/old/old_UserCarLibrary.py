from robot_car_wash_wxmp_library.common import CommonLibrary


class UserCarLibrary(CommonLibrary):
    def post_user_user_cars(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_cars".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "car_brand_id", "car_series", "car_brand", "car_scale", "car_model", "car_model_id", "car_series_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_user_cars_by_user_car_id(self, user_car_id):
        url = "{SERVER_DOMAIN}/user/user_cars/{user_car_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_car_id=user_car_id)
        return self.client.get(url)

    def get_user_user_cars(self):
        url = "{SERVER_DOMAIN}/user/user_cars".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_user_user_cars_by_user_car_id(self, user_car_id, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_cars/{user_car_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_car_id=user_car_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "brand_id", "car_brand", "car_series", "car_scale", "car_model", "car_series_id", "car_model_id"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_user_user_cars_is_default_by_user_car_id(self, user_car_id):
        url = "{SERVER_DOMAIN}/user/user_cars/{user_car_id}/is_default".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_car_id=user_car_id)
        return self.client.put(url)

    def delete_user_user_cars_by_user_car_id(self, user_car_id):
        url = "{SERVER_DOMAIN}/user/user_cars/{user_car_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_car_id=user_car_id)
        return self.client.delete(url)

