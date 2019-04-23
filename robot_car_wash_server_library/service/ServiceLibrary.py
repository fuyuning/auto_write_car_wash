from robot_car_wash_server_library.common import CommonLibrary


class ServiceLibrary(CommonLibrary):
    def post_admin_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_name", "cost_price", "price", "wash_normal_price", "wash_group_price", "member_price", "commission_price", "description", "order_by", "service_time"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_services_by_service_id(self, service_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/services/{service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, service_id=service_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("service_name", "cost_price", "price", "wash_normal_price", "wash_group_price", "member_price", "commission_price", "description", "order_by", "service_time"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_services_by_service_id(self, service_id):
        url = "{SERVER_DOMAIN}/admin/services/{service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, service_id=service_id)
        return self.client.delete(url)

