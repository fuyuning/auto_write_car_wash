from robot_washing_expert_library.common import CommonLibrary


class Oauth2Library(CommonLibrary):
    def post_oauth_2.0_token(self, **kwargs):
        url = "{SERVER_DOMAIN}/oauth/2.0/token".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("grant_type", "client_id", "secret", "userid", "mobile", "password"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_oauth_2.0_token(self, **kwargs):
        url = "{SERVER_DOMAIN}/oauth/2.0/token".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("grant_type", "client_id", "secret", "refresh"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_car_wash_user_captcha(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/user/captcha".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", ):
                data[k] = v
        return self.client.post(url, json=data)

    def post_car_wash_user_reset_password(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/user/reset_password".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "new_pass", "captcha", "serie"):
                data[k] = v
        return self.client.post(url, json=data)

    def put_car_wash_user_password(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/user/password".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("old_password", "new_pass"):
                data[k] = v
        return self.client.put(url, json=data)

