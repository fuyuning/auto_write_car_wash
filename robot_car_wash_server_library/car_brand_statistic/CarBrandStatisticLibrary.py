from robot_car_wash_server_library.common import CommonLibrary


class CarBrandStatisticLibrary(CommonLibrary):
    def get_admin_car_brand_statistics(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_brand_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_by", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

