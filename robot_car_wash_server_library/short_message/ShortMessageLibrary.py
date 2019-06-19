from robot_car_wash_server_library.common import CommonLibrary


class ShortMessageLibrary(CommonLibrary):
    def post_admin_short_messages(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_messages".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("smt_id", "name", "content", "user_id", "test_mobile", "remark"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_short_messages(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_messages".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "type", "remark", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_short_messages_by_sm_id(self, sm_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_messages/{sm_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, sm_id=sm_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_id", "status", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_short_messages_by_sm_id(self, sm_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_messages/{sm_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, sm_id=sm_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("remark", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_short_messages_by_sm_id(self, sm_id):
        url = "{SERVER_DOMAIN}/admin/short_messages/{sm_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, sm_id=sm_id)
        return self.client.delete(url)

