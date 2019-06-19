from robot_car_wash_wxmp_library.common import CommonLibrary


class InvitationBannerLibrary(CommonLibrary):
    def get_invitation_banners(self):
        url = "{SERVER_DOMAIN}/invitation_banners".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

