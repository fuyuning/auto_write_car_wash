from robot_car_wash_server_library.common import CommonLibrary


class CarWasherLibrary(CommonLibrary):
    def get_order_count_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}/order_count".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", ):
                data[k] = v
        return self.client.get(url)

