from robot_car_wash_wxmp_library.common import CommonLibrary


class MembershipLibrary(CommonLibrary):
    def get_user_memberships(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/memberships".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

