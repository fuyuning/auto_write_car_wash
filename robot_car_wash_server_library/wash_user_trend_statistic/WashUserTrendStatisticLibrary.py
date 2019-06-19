from robot_car_wash_server_library.common import CommonLibrary


class WashUserTrendStatisticLibrary(CommonLibrary):
    def get_admin_wash_user_trend_statistics_by_day(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_user_trend_statistics_by_day".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_by", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

