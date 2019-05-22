from robot_car_wash_server_library.common import CommonLibrary


class AdminUserLibrary(CommonLibrary):
    def post_admin_admin_users(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/admin_users".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "name", "mobile", "email", "password"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_admin_login(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/login".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("password", "username", "num", "vk"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_admin_logout(self):
        url = "{SERVER_DOMAIN}/admin/logout".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.post(url)

    def get_admin_admin_users(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/admin_users".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "name", "mobile", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_admin_users_by_username(self, username):
        url = "{SERVER_DOMAIN}/admin/admin_users/{username}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        return self.client.get(url)

    def get_admin_user(self):
        url = "{SERVER_DOMAIN}/admin/user".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def get_admin_get_verify_code(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/get_verify_code".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("num", "vk"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_admin_users_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/admin_users/{username}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "name", "mobile", "email", "password"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_admin_admin_users_is_active_by_username(self, username, **kwargs):
        url = "{SERVER_DOMAIN}/admin/admin_users/{username}/is_active".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, username=username)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_active", ):
                data[k] = v
        return self.client.patch(url)

