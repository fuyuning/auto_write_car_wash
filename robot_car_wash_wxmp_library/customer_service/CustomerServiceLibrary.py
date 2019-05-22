from robot_car_wash_wxmp_library.common import CommonLibrary


class CustomerServiceLibrary(CommonLibrary):
    def post_user_customer_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/customer_services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_record_id", "reason", "description", "is_refund"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_customer_services(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/customer_services".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_customer_services_by_customer_service_id(self, customer_service_id):
        url = "{SERVER_DOMAIN}/user/customer_services/{customer_service_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, customer_service_id=customer_service_id)
        return self.client.get(url)

