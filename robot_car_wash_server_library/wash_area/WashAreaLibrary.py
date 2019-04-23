from robot_car_wash_server_library.common import CommonLibrary


class WashAreaLibrary(CommonLibrary):
    def post_admin_wash_areas(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_areas".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "province", "city", "district", "service_type", "wash_normal", "wash_group", "user_group", "enabled"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_wash_areas(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_areas".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "enabled", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_wash_areas_by_wash_area_id(self, wash_area_id):
        url = "{SERVER_DOMAIN}/admin/wash_areas/{wash_area_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_area_id=wash_area_id)
        return self.client.get(url)

    def put_admin_wash_areas_by_wash_area_id(self, wash_area_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_areas/{wash_area_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_area_id=wash_area_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "province", "city", "district", "service_type", "wash_normal", "wash_group", "user_group", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_(wash_normal|wash_group|user_group|enabled)_by_wash_area_id(self, wash_area_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_areas/{wash_area_id}/(wash_normal|wash_group|user_group|enabled)".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_area_id=wash_area_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_normal", "wash_group", "user_group", "enabled"):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_wash_areas_by_wash_area_id(self, wash_area_id):
        url = "{SERVER_DOMAIN}/admin/wash_areas/{wash_area_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_area_id=wash_area_id)
        return self.client.delete(url)

