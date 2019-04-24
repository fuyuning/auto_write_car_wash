from robot_car_wash_wxmp_library.common import CommonLibrary


class WashGroupLibrary(CommonLibrary):
    def post_user_wash_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}user/wash_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_able_group_id", "parking_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_wash_able_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/wash_able_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", ):
                data[k] = v
        return self.client.get(url)

    def get_wash_groups(self, **kwargs):
        url = "{SERVER_DOMAIN}/wash_groups".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "wash_area_id", "parking_id"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_wash_groups_by_wash_group_id(self, wash_group_id):
        url = "{SERVER_DOMAIN}/wash_groups/{wash_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_group_id=wash_group_id)
        return self.client.get(url)

