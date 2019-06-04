from robot_car_wash_server_library.common import CommonLibrary


class RefundLibrary(CommonLibrary):
    def get_admin_refunds(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/refunds".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_id", ):
                data[k] = v
        return self.client.get(url, params=data)

