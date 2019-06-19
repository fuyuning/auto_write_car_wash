from robot_car_wash_server_library.common import CommonLibrary


class InvitationLibrary(CommonLibrary):
    def get_admin_invitations(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/invitations".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("userid", "invited_userid", "first_car_id", "first_mobile", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

