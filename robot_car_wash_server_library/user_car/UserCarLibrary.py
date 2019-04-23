from robot_car_wash_server_library.common import CommonLibrary


class UserCarLibrary(CommonLibrary):
    def get_admin_user_cars(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/user_cars".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_id", ):
                data[k] = v
        return self.client.get(url)

