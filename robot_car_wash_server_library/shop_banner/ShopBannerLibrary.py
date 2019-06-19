from robot_car_wash_server_library.common import CommonLibrary


class ShopBannerLibrary(CommonLibrary):
    def get_admin_shop_banner(self):
        url = "{SERVER_DOMAIN}/admin/shop_banner".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_shop_banner_by_shop_banner_id(self, shop_banner_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/shop_banner/{shop_banner_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, shop_banner_id=shop_banner_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("banner", "service_introduce"):
                data[k] = v
        return self.client.put(url, json=data)

