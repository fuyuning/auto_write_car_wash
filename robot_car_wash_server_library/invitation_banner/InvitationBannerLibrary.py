from robot_car_wash_server_library.common import CommonLibrary


class InvitationBannerLibrary(CommonLibrary):
    def get_admin_invitation_banner(self):
        url = "{SERVER_DOMAIN}/admin/invitation_banner".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_invitation_banner_by_invitation_banner_id(self, invitation_banner_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/invitation_banner/{invitation_banner_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, invitation_banner_id=invitation_banner_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("entrance_banner", "interface_poster"):
                data[k] = v
        return self.client.put(url, json=data)

