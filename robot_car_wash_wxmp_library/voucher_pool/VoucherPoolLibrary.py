from robot_car_wash_wxmp_library.common import CommonLibrary


class VoucherPoolLibrary(CommonLibrary):
    def get_voucher_pools(self):
        url = "{SERVER_DOMAIN}/voucher_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

