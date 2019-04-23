from robot_car_wash_server_library.common import CommonLibrary


class OrderLibrary(CommonLibrary):
    def post_practice_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/practice/orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", "car_id", "mobile", "name"):
                data[k] = v
        return self.client.post(url, json=data)

