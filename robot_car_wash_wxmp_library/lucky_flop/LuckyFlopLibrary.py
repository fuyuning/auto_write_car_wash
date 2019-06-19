from robot_car_wash_wxmp_library.common import CommonLibrary


class LuckyFlopLibrary(CommonLibrary):
    def post_user_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", "parking_id", "service_group_id", "car_series_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_user_lucky_flop_award(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop_award".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("lucky_flop_award_id", "wash_normal_id", "lucky_flop_id", "custom_price"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_user_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", "parking_id", "service_group_id", "car_series_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_user_lucky_flop_award(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop_award".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("lucky_flop_award_id", "wash_normal_id", "lucky_flop_id", "custom_price"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_can_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/can_lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", ):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", ):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_can_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/can_lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", ):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_lucky_flop(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/lucky_flop".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal_id", ):
                data[k] = v
        return self.client.get(url, params=data)

