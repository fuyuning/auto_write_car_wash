from robot_car_wash_server_library.common import CommonLibrary


class WashUserStatisticLibrary(CommonLibrary):
    def get_admin_wash_user_statistics(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_user_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_id", "order_by", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_wash_user_statistics_visible_by_wash_user_statistic_id(self, wash_user_statistic_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_user_statistics/{wash_user_statistic_id}/visible".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_user_statistic_id=wash_user_statistic_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("visible", ):
                data[k] = v
        return self.client.patch(url, json=data)

