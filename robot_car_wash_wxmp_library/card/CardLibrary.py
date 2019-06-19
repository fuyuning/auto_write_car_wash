from robot_car_wash_wxmp_library.common import CommonLibrary


class CardLibrary(CommonLibrary):
    def get_cards_price_by_card_id(self, card_id):
        url = "{SERVER_DOMAIN}/cards/{card_id}/price".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_id=card_id)
        return self.client.get(url)

    def get_coupon_pools_coupon_pool_id(self, **kwargs):
        url = "{SERVER_DOMAIN}/coupon_pools/coupon_pool_id".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("card_id", ):
                data[k] = v
        return self.client.get(url, params=data)

