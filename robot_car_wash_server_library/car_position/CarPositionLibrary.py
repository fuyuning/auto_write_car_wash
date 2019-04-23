from robot_car_wash_server_library.common import CommonLibrary


class CarPositionLibrary(CommonLibrary):
    def post_car_positions_import(self):
        url = "{SERVER_DOMAIN}admin/car_positions/import".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.post(url)

    def post_car_positions_manual(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_positions/manual".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "wash_area_id", "parking_id", "entry_time", "lon", "lat", "phase", "floor", "zone", "space_no", "ownership"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_car_positions(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_positions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_car_postion_id(self, ):
        url = "{SERVER_DOMAIN}/admin/car_positions/car_postion_id".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_car_positions_by_car_position_id(self, car_position_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_positions/{car_position_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_position_id=car_position_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "wash_area_id", "parking_id", "entry_time", "lon", "lat", "phase", "floor", "zone", "space_no", "ownership"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_car_positions_by_car_position_id(self, car_position_id):
        url = "{SERVER_DOMAIN}/admin/car_positions/{car_position_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_position_id=car_position_id)
        return self.client.delete(url)

