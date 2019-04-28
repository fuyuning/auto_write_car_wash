from robot_car_wash_server_library.common import CommonLibrary


class WechatMenuLibrary(CommonLibrary):
    def post_admin_wechat_menus(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wechat_menus".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("button", ):
                data[k] = v
        return self.client.post(url)

    def get_admin_wechat_menus(self):
        url = "{SERVER_DOMAIN}/admin/wechat_menus".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

