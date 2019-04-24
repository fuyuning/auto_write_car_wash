from robot_car_wash_wxmp_library.common import CommonLibrary


class CardSaleLibrary(CommonLibrary):
    def get_card_sales(self, **kwargs):
        url = "{SERVER_DOMAIN}/card_sales".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

