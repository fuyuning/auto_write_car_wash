from robot_car_wash_server_library.common import CommonLibrary


class LuckyFlopLibrary(CommonLibrary):
    def post_admin_lucky_flops(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flops".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("rule_name", "rule_no", "button_name", "flop_day", "flop_week", "price_min", "price_status", "price_set", "flop_set", "enabled"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_admin_lucky_flop_users_import(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flop_users/import".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("file", ):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_lucky_flops(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flops".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("rule_name", "enabled"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_lucky_flop_awards(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flop_awards".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("lucky_flop_id", "user_id", "rule_no", "parking_name", "status"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_lucky_flops_by_lucky_flop_id(self, lucky_flop_id):
        url = "{SERVER_DOMAIN}/admin/lucky_flops/{lucky_flop_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lucky_flop_id=lucky_flop_id)
        return self.client.get(url)

    def get_admin_lucky_flop_default(self):
        url = "{SERVER_DOMAIN}/admin/lucky_flop_default".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_lucky_flops_by_lucky_flop_id(self, lucky_flop_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flops/{lucky_flop_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lucky_flop_id=lucky_flop_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("rule_name", "rule_no", "button_name", "flop_day", "flop_week", "price_min", "price_status", "price_set", "flop_set", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_admin_lucky_flop_default_by_lucky_flop_default_id(self, lucky_flop_default_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flop_default/{lucky_flop_default_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lucky_flop_default_id=lucky_flop_default_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("lucky_flop_id", ):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_admin_lucky_flops_enabled_by_lucky_flop_id(self, lucky_flop_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flops/{lucky_flop_id}/enabled".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lucky_flop_id=lucky_flop_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def patch_admin_lucky_flop_default_enabled(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/lucky_flop_default/enabled".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_lucky_flops_by_lucky_flop_id(self, lucky_flop_id):
        url = "{SERVER_DOMAIN}/admin/lucky_flops/{lucky_flop_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lucky_flop_id=lucky_flop_id)
        return self.client.delete(url)

