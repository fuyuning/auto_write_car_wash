from robot_car_wash_server_library.common import CommonLibrary


class HomePageBannerLibrary(CommonLibrary):
    def get_home_page_banners(self):
        url = "{SERVER_DOMAIN}/home_page_banners".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

