from robot_car_wash_app_library.common import CommonLibrary


class Oauth2Library(CommonLibrary):
    def post_oauth_2.0_token(self, **kwargs):
        url = "{SERVER_DOMAIN}/oauth/2.0/token".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("grant_type", "client_id", "secret", "userid", "password"):
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

