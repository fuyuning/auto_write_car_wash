from robot_car_wash_wxmp_library.common import CommonLibrary


class LoginLibrary(CommonLibrary):
    def post_wechat_userinfo_decrypt(self, **kwargs):
        url = "{SERVER_DOMAIN}/wechat/userinfo/decrypt".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("nickName", "avatarUrl", "code", "rawData", "signature", "encryptedData", "iv"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_login_by_unionid(self, **kwargs):
        url = "{SERVER_DOMAIN}/login_by_unionid".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("client_id", "secret", "unionid"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_login_by_openid(self, **kwargs):
        url = "{SERVER_DOMAIN}/login_by_openid".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("client_id", "secret", "openid"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_login_by_mobile(self, **kwargs):
        url = "{SERVER_DOMAIN}/login_by_mobile".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("client_id", "secret", "mobile", "serie", "captcha", "openid", "union_id", "mn_open_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_openid_by_tokenid(self, **kwargs):
        url = "{SERVER_DOMAIN}/openid_by_tokenid".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("tokenid", ):
                data[k] = v
        return self.client.get(url)

