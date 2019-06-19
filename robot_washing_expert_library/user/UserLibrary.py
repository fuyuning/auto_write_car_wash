from robot_washing_expert_library.common import CommonLibrary


class UserLibrary(CommonLibrary):
    def get_car_wash_user(self):
        url = "{SERVER_DOMAIN}/car_wash/user".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

