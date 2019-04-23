from robot_car_wash_server_library.common import CommonLibrary


class CarMoveQrcodeLibrary(CommonLibrary):
    def post_user_car_move_qrcodes(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/car_move_qrcodes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", ):
                data[k] = v
        return self.client.post(url)

    def get_user_car_move_qrcodes(self):
        url = "{SERVER_DOMAIN}/user/car_move_qrcodes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

