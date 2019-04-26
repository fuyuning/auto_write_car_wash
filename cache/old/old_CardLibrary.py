from robot_car_wash_wxmp_library.common import CommonLibrary


class CardLibrary(CommonLibrary):
    def get_price_by_card_id(self, card_id):
        url = "{SERVER_DOMAIN}/cards/{card_id}/price".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_id=card_id)
        return self.client.get(url)

