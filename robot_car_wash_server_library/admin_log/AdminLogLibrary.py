from robot_car_wash_server_library.common import CommonLibrary


class AdminLogLibrary(CommonLibrary):
    def get_admin_admin_logs(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/admin_logs".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

