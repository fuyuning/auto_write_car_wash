from robot_car_wash_server_library.common import CommonLibrary


class CarMoveQrcodeLibrary(CommonLibrary):
    def post_admin_car_move_qrcodes_finish_by_car_move_qrcode_id(self, car_move_qrcode_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_move_qrcodes/{car_move_qrcode_id}/finish".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_move_qrcode_id=car_move_qrcode_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("qrcode_remark", "status"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_car_move_qrcodes(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_move_qrcodes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_move_qrcode_id", "user_id", "mobile", "status", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_car_move_qrcodes_by_car_move_qrcode_id(self, car_move_qrcode_id):
        url = "{SERVER_DOMAIN}/admin/car_move_qrcodes/{car_move_qrcode_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_move_qrcode_id=car_move_qrcode_id)
        return self.client.delete(url)

