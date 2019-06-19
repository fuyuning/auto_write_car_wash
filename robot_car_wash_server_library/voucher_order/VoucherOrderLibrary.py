from robot_car_wash_server_library.common import CommonLibrary


class VoucherOrderLibrary(CommonLibrary):
    def get_admin_voucher_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/voucher_orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("voucher_order_no", "user_id", "mobile", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_voucher_sub_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/voucher_sub_orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("voucher_order_no", ):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_voucher_orders_by_voucher_order_id(self, voucher_order_id):
        url = "{SERVER_DOMAIN}/admin/voucher_orders/{voucher_order_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, voucher_order_id=voucher_order_id)
        return self.client.delete(url)

