from robot_car_wash_wxmp_library.common import CommonLibrary


class CardOrderLibrary(CommonLibrary):
    def post_card_orders(self, **kwargs):
        url = "{SERVER_DOMAIN}/card_orders".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("card_id", ):
                data[k] = v
        return self.client.post(url)

    def post_card_orders_pay_by_card_order_id(self, card_order_id, **kwargs):
        url = "{SERVER_DOMAIN}/card_orders/{card_order_id}/pay".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_order_id=card_order_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("pay_type", "openid"):
                data[k] = v
        return self.client.post(url, json=data)

