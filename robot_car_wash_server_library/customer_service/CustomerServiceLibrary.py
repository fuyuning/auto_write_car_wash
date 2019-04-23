from robot_car_wash_server_library.common import CommonLibrary


class CustomerServiceLibrary(CommonLibrary):
    def post_finish_by_customer_service_id(self, customer_service_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/customer_services/{customer_service_id}/finish".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, customer_service_id=customer_service_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("opinion", "is_refund"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_customer_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/customer_services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_no", "customer_service_no", "car_id", "mobile", "user_id", "reason", "status", "order_status", "start_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_customer_services_by_customer_service_id(self, customer_service_id):
        url = "{SERVER_DOMAIN}/admin/customer_services/{customer_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, customer_service_id=customer_service_id)
        return self.client.get(url)

    def delete_admin_customer_services_by_customer_service_id(self, customer_service_id):
        url = "{SERVER_DOMAIN}/admin/customer_services/{customer_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, customer_service_id=customer_service_id)
        return self.client.delete(url)

