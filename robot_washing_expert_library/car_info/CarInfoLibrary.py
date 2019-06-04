from robot_washing_expert_library.common import CommonLibrary


class CarInfoLibrary(CommonLibrary):
    def get_car_wash_car_infos(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_infos".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_ids", ):
                data[k] = v
        return self.client.get(url, params=data)

    def put_car_wash_car_infos_by_car_info_id(self, car_info_id, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_infos/{car_info_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_info_id=car_info_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_images", ):
                data[k] = v
        return self.client.put(url, json=data)

