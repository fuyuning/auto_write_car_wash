from robot_car_wash_wxmp_library.common import CommonLibrary


class SummonLibrary(CommonLibrary):
    def post_user_summons(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/summons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("lon", "lat", "name"):
                data[k] = v
        return self.client.post(url, json=data)

