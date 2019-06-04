from robot_washing_expert_library.common import CommonLibrary


class LinePromotionLibrary(CommonLibrary):
    def post_car_wash_line_promotions(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/line_promotions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "parking_id", "sex", "age", "user_tag", "description"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_car_wash_line_promotions(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/line_promotions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", ):
                data[k] = v
        return self.client.get(url, params=data)

