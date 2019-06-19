from robot_car_wash_wxmp_library.common import CommonLibrary


class ShopBannerLibrary(CommonLibrary):
    def get_shop_banner(self):
        url = "{SERVER_DOMAIN}/shop_banner".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

