from robot_car_wash_server_library.common import CommonLibrary


class VoucherPoolLibrary(CommonLibrary):
    def post_admin_voucher_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/voucher_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "price", "denomination", "num", "num_status", "sell", "days", "description", "buy_num", "give_num", "service_groups", "service_types"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_voucher_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/voucher_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "created_section", "sell"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_voucher_pools_by_voucher_pool_id(self, voucher_pool_id):
        url = "{SERVER_DOMAIN}/admin/voucher_pools/{voucher_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, voucher_pool_id=voucher_pool_id)
        return self.client.get(url)

    def put_admin_voucher_pools_by_voucher_pool_id(self, voucher_pool_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/voucher_pools/{voucher_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, voucher_pool_id=voucher_pool_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "price", "denomination", "num", "num_status", "sell", "days", "description", "buy_num", "give_num", "service_groups", "service_types"):
                data[k] = v
        return self.client.put(url, json=data)

