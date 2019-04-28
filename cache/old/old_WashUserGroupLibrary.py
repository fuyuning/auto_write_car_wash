from robot_car_wash_server_library.common import CommonLibrary


class WashUserGroupLibrary(CommonLibrary):
    def post_admin_wash_user_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_user_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "order_by"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_wash_user_groups(self):
        url = "{SERVER_DOMAIN}/admin/wash_user_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def get_admin_wash_user_groups_by_wash_user_group_id(self, wash_user_group_id):
        url = "{SERVER_DOMAIN}/admin/wash_user_groups/{wash_user_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_user_group_id=wash_user_group_id)
        return self.client.get(url)

    def put_admin_wash_user_groups_by_wash_user_group_id(self, wash_user_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_user_groups/{wash_user_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_user_group_id=wash_user_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "order_by"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_wash_user_groups_by_wash_user_group_id(self, wash_user_group_id):
        url = "{SERVER_DOMAIN}/admin/wash_user_groups/{wash_user_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_user_group_id=wash_user_group_id)
        return self.client.delete(url)

