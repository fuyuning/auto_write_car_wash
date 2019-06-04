from robot_car_wash_wxmp_library.common import CommonLibrary


class WashRecordLibrary(CommonLibrary):
    def get_user_wash_records_total_number(self):
        url = "{SERVER_DOMAIN}/user/wash_records/total_number".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def get_user_after_sales(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/after_sales".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "order_status", "after_sale", "section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_wash_record_by_order(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/wash_record_by_order".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("refresh", "order_id"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_wash_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/wash_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "order_status", "section", "page_limit", "comment_status"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_wash_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/wash_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_group_id", "section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

