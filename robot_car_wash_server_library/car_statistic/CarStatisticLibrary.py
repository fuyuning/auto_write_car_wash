from robot_car_wash_server_library.common import CommonLibrary


class CarStatisticLibrary(CommonLibrary):
    def get_admin_car_statistics(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "last_section", "order_by", "wash_area_id", "parking_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_visible_by_car_statistic_id(self, car_statistic_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_statistics/{car_statistic_id}/visible".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_statistic_id=car_statistic_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("visible", ):
                data[k] = v
        return self.client.patch(url)

