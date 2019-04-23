from robot_car_wash_server_library.common import CommonLibrary


class CarInfoLibrary(CommonLibrary):
    def post_car_infos_import(self):
        url = "{SERVER_DOMAIN}admin/car_infos/import".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.post(url)

    def get_admin_car_infos(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_infos".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "car_type", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_car_infos_by_car_info_id(self, car_info_id):
        url = "{SERVER_DOMAIN}/admin/car_infos/{car_info_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_info_id=car_info_id)
        return self.client.get(url)

    def put_admin_car_infos_by_car_info_id(self, car_info_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_infos/{car_info_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_info_id=car_info_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "car_type", "car_brand", "car_series", "car_color", "car_frame_no", "licensed_time", "car_year", "car_images", "car_tire_pressure", "description"):
                data[k] = v
        return self.client.put(url, json=data)

