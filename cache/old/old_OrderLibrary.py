from robot_car_wash_wxmp_library.common import CommonLibrary


class OrderLibrary(CommonLibrary):
    def post_order_service_group(self, **kwargs):
        url = "{SERVER_DOMAIN}/order/service_group".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_id", "service_group_id", "old_order_id", "car_type"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_group_id", "wash_normal_id", "parking_id", "wxmp_remark", "coupon_id", "service_group_id", "car_id", "mobile", "name", "car_type", "order_type", "user_car_id", "user_contact_id", "car_place", "card_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_orders_pay_by_order_id(self, order_id, **kwargs):
        url = "{SERVER_DOMAIN}/orders/{order_id}/pay".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, order_id=order_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("pay_type", ):
                data[k] = v
        return self.client.post(url)

    def get_price_range(self, **kwargs):
        url = "{SERVER_DOMAIN}/price_range".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", "wash_group_id", "wash_able_group_id"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_orders_by_order_id(self, order_id):
        url = "{SERVER_DOMAIN}/orders/{order_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, order_id=order_id)
        return self.client.get(url)

