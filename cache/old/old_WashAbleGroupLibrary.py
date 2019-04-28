from robot_car_wash_server_library.common import CommonLibrary


class WashAbleGroupLibrary(CommonLibrary):
    def patch_admin_wash_able_groups_by_wash_able_group_id(self, wash_able_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_able_groups/{wash_able_group_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_able_group_id=wash_able_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("spec_people_day_num", ):
                data[k] = v
        return self.client.patch(url)

