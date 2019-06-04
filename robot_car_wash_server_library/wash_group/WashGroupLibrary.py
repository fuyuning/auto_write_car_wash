from robot_car_wash_server_library.common import CommonLibrary


class WashGroupLibrary(CommonLibrary):
    def post_admin_wash_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "valid_start_time", "valid_end_time", "is_diff_car_type", "service_groups", "people_num", "wash_area_id", "expect_time", "car_washer_ids", "auto_group"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_admin_wash_groups_join_by_wash_group_id(self, wash_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_groups/{wash_group_id}/join".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_group_id=wash_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("robot_num", ):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_wash_groups_by_wash_group_id(self, wash_group_id):
        url = "{SERVER_DOMAIN}/admin/wash_groups/{wash_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_group_id=wash_group_id)
        return self.client.get(url)

    def get_admin_wash_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_group_no", "status", "wash_area_id", "valid_start_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_wash_groups_by_wash_group_id(self, wash_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_groups/{wash_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_group_id=wash_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "valid_start_time", "valid_end_time", "is_diff_car_type", "service_groups", "people_num", "wash_area_id", "expect_time", "car_washer_ids", "auto_group"):
                data[k] = v
        return self.client.put(url, json=data)

