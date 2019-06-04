from robot_car_wash_server_library.common import CommonLibrary


class CarWasherAbilityLibrary(CommonLibrary):
    def get_admin_car_washer_ability(self):
        url = "{SERVER_DOMAIN}/admin/car_washer_ability".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_car_washer_ability(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washer_ability".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("ability_value", ):
                data[k] = v
        return self.client.put(url, json=data)

