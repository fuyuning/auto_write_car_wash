from robot_car_wash_wxmp_library.common import CommonLibrary


class CarMoveQrcodeLibrary(CommonLibrary):
    def post_user_car_move_qrcodes(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/car_move_qrcodes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "wash_area_name", "car_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_car_move_qrcodes(self):
        url = "{SERVER_DOMAIN}/user/car_move_qrcodes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

