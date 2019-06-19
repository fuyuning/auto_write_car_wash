from robot_car_wash_server_library.common import CommonLibrary


class HomePageBannerLibrary(CommonLibrary):
    def post_admin_parkings(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parkings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("banners", "service_introduce"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_home_page_banners(self):
        url = "{SERVER_DOMAIN}/admin/home_page_banners".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_home_page_banners_by_home_page_banner_id(self, home_page_banner_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/home_page_banners/{home_page_banner_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, home_page_banner_id=home_page_banner_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("banners", "service_introduce"):
                data[k] = v
        return self.client.put(url, json=data)

