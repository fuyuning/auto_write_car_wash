from robot_car_wash_server_library.common import CommonLibrary


class WashUserLibrary(CommonLibrary):
    def post_user_user_forms(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_forms".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("formid", ):
                data[k] = v
        return self.client.post(url)

    def get_user_user_info(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_info".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("unionid", ):
                data[k] = v
        return self.client.get(url)

    def put_user_user_info(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_info".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wx_nickname", "wx_avatarurl", "unionid", "mobile"):
                data[k] = v
        return self.client.put(url, json=data)

