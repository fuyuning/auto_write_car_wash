from robot_car_wash_server_library.common import CommonLibrary


class ServiceGroupLibrary(CommonLibrary):
    def post_admin_service_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/service_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_group_name", "service_original_price", "pricing_strategy", "cost_price", "service_original_price", "wash_normal_price", "wash_group_price", "membership_price", "commission_price", "wash_normal_percent", "wash_group_percent", "membership_percent", "service_ids", "intelligent_service_ids", "order_by", "description"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_service_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/service_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("pricing_strategy", "service_group_name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_service_groups_by_service_group_id(self, service_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/service_groups/{service_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, service_group_id=service_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_group_name", "service_original_price", "cost_price", "service_original_price", "wash_normal_price", "wash_group_price", "membership_price", "commission_price", "wash_normal_percent", "wash_group_percent", "membership_percent", "service_ids", "intelligent_service_ids", "order_by", "description"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_service_groups_by_service_group_id(self, service_group_id):
        url = "{SERVER_DOMAIN}/admin/service_groups/{service_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, service_group_id=service_group_id)
        return self.client.delete(url)

