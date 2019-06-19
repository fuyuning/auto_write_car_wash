from robot_car_wash_wxmp_library.common import CommonLibrary


class VoucherOrderLibrary(CommonLibrary):
    def post_voucher_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/voucher_orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("voucher_info", ):
                data[k] = v
        return self.client.post(url, json=data)

    def post_voucher_orders_pay_by_voucher_order_id(self, voucher_order_id, **kwargs):
        url = "{SERVER_DOMAIN}/voucher_orders/{voucher_order_id}/pay".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, voucher_order_id=voucher_order_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("pay_type", "openid"):
                data[k] = v
        return self.client.post(url, json=data)

