from robot_car_wash_server_library.common import CommonLibrary


class PromoterStatisticLibrary(CommonLibrary):
    def get_admin_promoter_statistics(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoter_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("promoter_no", "name", "mobile", "section", "order_by", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_promoter_statistics_visible_by_promoter_statistic_id(self, promoter_statistic_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoter_statistics/{promoter_statistic_id}/visible".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, promoter_statistic_id=promoter_statistic_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("visible", ):
                data[k] = v
        return self.client.patch(url)

