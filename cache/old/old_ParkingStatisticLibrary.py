from robot_car_wash_server_library.common import CommonLibrary


class ParkingStatisticLibrary(CommonLibrary):
    def get_admin_parking_statistics_by_day(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parking_statistics_by_day".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_by", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_visible_by_parking_statistic_id(self, parking_statistic_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parking_statistics_by_day/{parking_statistic_id}/visible".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_statistic_id=parking_statistic_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("visible", ):
                data[k] = v
        return self.client.patch(url)

