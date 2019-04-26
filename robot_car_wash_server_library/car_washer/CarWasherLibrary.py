from robot_car_wash_server_library.common import CommonLibrary


class CarWasherLibrary(CommonLibrary):
    def post_admin_car_washers(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "name", "mobile", "birthday", "ID_card", "address", "sex", "promoter_no", "password", "is_active"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_car_washers(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "mobile", "name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_car_washers_by_username(self, username):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        return self.client.get(url)

    def get_wash_records_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}/wash_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_order_count_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}/order_count".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", ):
                data[k] = v
        return self.client.get(url)

    def put_admin_car_washers_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "mobile", "sex", "birthday", "ID_card", "address", "promoter_no", "password", "is_active"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_is_active_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washers/{username}/is_active".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_active", ):
                data[k] = v
        return self.client.patch(url)

