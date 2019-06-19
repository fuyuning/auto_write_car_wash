from robot_car_wash_wxmp_library.common import CommonLibrary


class VoucherLibrary(CommonLibrary):
    def get_user_vouchers(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/vouchers".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

