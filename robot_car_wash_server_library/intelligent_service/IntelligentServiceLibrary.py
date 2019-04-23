from robot_car_wash_server_library.common import CommonLibrary


class IntelligentServiceLibrary(CommonLibrary):
    def post_admin_intelligent_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/intelligent_services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "choose_car_model_id", "cost_price", "min_cost_price", "max_cost_price", "price", "min_price", "max_price", "wash_normal_price", "min_wash_normal_price", "max_wash_normal_price", "wash_group_price", "min_wash_group_price", "max_wash_group_price", "member_price", "min_member_price", "max_member_price", "commission_percent", "standard_time", "special_car_models", "order_by", "description"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_intelligent_services_by_intelligent_service_id(self, intelligent_service_id):
        url = "{SERVER_DOMAIN}/admin/intelligent_services/{intelligent_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, intelligent_service_id=intelligent_service_id)
        return self.client.get(url)

    def get_admin_intelligent_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/intelligent_services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_intelligent_services_by_intelligent_service_id(self, intelligent_service_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/intelligent_services/{intelligent_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, intelligent_service_id=intelligent_service_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "choose_car_model_id", "cost_price", "min_cost_price", "max_cost_price", "price", "min_price", "max_price", "wash_normal_price", "min_wash_normal_price", "max_wash_normal_price", "wash_group_price", "min_wash_group_price", "max_wash_group_price", "member_price", "min_member_price", "max_member_price", "commission_percent", "standard_time", "special_car_models", "order_by", "description"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_intelligent_services_by_intelligent_service_id(self, intelligent_service_id):
        url = "{SERVER_DOMAIN}/admin/intelligent_services/{intelligent_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, intelligent_service_id=intelligent_service_id)
        return self.client.delete(url)

