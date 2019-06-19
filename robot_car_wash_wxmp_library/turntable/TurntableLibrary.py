from robot_car_wash_wxmp_library.common import CommonLibrary


class TurntableLibrary(CommonLibrary):
    def post_user_turntable_award(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/turntable/award".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("key", "mobile"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_turntable(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/turntable".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("key", ):
                data[k] = v
        return self.client.get(url, params=data)

