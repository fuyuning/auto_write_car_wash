from robot_car_wash_server_library.common import CommonLibrary


class CarWasherStatisticLibrary(CommonLibrary):
    def get_admin_car_washer_statistics(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washer_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "mobile", "section", "order_by", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_visible_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washer_statistics/{username}/visible".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("visible", ):
                data[k] = v
        return self.client.patch(url)

