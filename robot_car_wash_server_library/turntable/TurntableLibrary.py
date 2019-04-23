from robot_car_wash_server_library.common import CommonLibrary


class TurntableLibrary(CommonLibrary):
    def post_admin_turntables(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/turntables".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "wash_user_group_ids", "prizes", "enabled"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_turntables(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/turntables".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "wash_user_group_id", "enabled"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_turntables_by_turntable_id(self, turntable_id):
        url = "{SERVER_DOMAIN}/admin/turntables/{turntable_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, turntable_id=turntable_id)
        return self.client.get(url)

    def get_admin_turntable_awards(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/turntable_awards".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("turntable_id", "userid", "mobile", "status", "is_awarded", "prize_name", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_turntables_by_turntable_id(self, turntable_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/turntables/{turntable_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, turntable_id=turntable_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "wash_user_group_ids", "prizes", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_enabled_by_turntable_id(self, turntable_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/turntables/{turntable_id}/enabled".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, turntable_id=turntable_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url)

    def delete_admin_turntables_by_turntable_id(self, turntable_id):
        url = "{SERVER_DOMAIN}/admin/turntables/{turntable_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, turntable_id=turntable_id)
        return self.client.delete(url)

