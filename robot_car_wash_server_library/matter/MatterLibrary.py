from robot_car_wash_server_library.common import CommonLibrary


class MatterLibrary(CommonLibrary):
    def post_admin_matters(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/matters".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "matter_type", "start_time", "end_time", "duration", "reason"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_matters(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/matters".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "matter_type", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_matters_by_matter_id(self, matter_id):
        url = "{SERVER_DOMAIN}/admin/matters/{matter_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, matter_id=matter_id)
        return self.client.get(url)

    def put_admin_matters_by_matter_id(self, matter_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/matters/{matter_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, matter_id=matter_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "matter_type", "start_time", "end_time", "duration", "reason"):
                data[k] = v
        return self.client.put(url, json=data)

