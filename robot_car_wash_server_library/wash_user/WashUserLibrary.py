from robot_car_wash_server_library.common import CommonLibrary


class WashUserLibrary(CommonLibrary):
    def post_admin_wash_users_clear_by_userid(self, userid, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_users/{userid}/clear".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, userid=userid)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", ):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_wash_users(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_users".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("userid", "wash_user_group_id", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_wash_users_userid(self):
        url = "{SERVER_DOMAIN}/admin/wash_users/userid".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def get_admin_wechat_info(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wechat_info".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("userid", ):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_wash_users_wash_user_group_by_userid(self, userid, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_users/{userid}/wash_user_group".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, userid=userid)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_user_group_id", ):
                data[k] = v
        return self.client.patch(url, json=data)

