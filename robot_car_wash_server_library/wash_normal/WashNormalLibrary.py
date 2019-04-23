from robot_car_wash_server_library.common import CommonLibrary


class WashNormalLibrary(CommonLibrary):
    def get_admin_wash_normals_by_wash_normal_id(self, wash_normal_id):
        url = "{SERVER_DOMAIN}/admin/wash_normals/{wash_normal_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_normal_id=wash_normal_id)
        return self.client.get(url)

    def get_admin_wash_normals(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_normals".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_wash_normals_by_wash_normal_id(self, wash_normal_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_normals/{wash_normal_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_normal_id=wash_normal_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("start_time", "end_time", "is_diff_car_type", "people_day_num", "expect_time", "expect_day", "expect_type", "expect_hour", "car_washer_ids", "service_groups", "day_in_week", "spec_people_day_num", "time_loop_set"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_admin_wash_normals_by_wash_normal_id(self, wash_normal_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_normals/{wash_normal_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_normal_id=wash_normal_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("start_time", "end_time", "is_diff_car_type", "people_day_num", "expect_time", "expect_day", "expect_type", "expect_hour", "car_washer_ids", "service_groups"):
                data[k] = v
        return self.client.put(url, json=data)

