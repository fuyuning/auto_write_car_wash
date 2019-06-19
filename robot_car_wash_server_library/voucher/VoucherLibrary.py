from robot_car_wash_server_library.common import CommonLibrary


class VoucherLibrary(CommonLibrary):
    def get_admin_vouchers(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/vouchers".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "user_id", "car_id", "mobile", "status", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

