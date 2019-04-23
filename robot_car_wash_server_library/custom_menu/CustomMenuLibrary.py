from robot_car_wash_server_library.common import CommonLibrary


class CustomMenuLibrary(CommonLibrary):
    def put_admin_custom_menus(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/custom_menus".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("menu", ):
                data[k] = v
        return self.client.put(url)

