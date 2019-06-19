from robot_car_wash_server_library.common import CommonLibrary


class ShortMessageTemplateLibrary(CommonLibrary):
    def post_admin_short_message_templates(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_message_templates".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "type", "content", "enabled"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_short_message_templates(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_message_templates".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "content", "type", "enabled", "smt_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_short_message_templates_by_smt_id(self, smt_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_message_templates/{smt_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, smt_id=smt_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "type", "content", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_admin_short_message_templates_by_smt_id(self, smt_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/short_message_templates/{smt_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, smt_id=smt_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_short_message_templates_by_smt_id(self, smt_id):
        url = "{SERVER_DOMAIN}/admin/short_message_templates/{smt_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, smt_id=smt_id)
        return self.client.delete(url)

