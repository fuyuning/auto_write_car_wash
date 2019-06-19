from robot_car_wash_server_library.common import CommonLibrary


class CarWasherWageLibrary(CommonLibrary):
    def get_admin_car_washer_wages(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/car_washer_wages".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "name", "end_time", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_car_washer_wages_by_car_washer_wage_id(self, car_washer_wage_id):
        url = "{SERVER_DOMAIN}/admin/car_washer_wages/{car_washer_wage_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_washer_wage_id=car_washer_wage_id)
        return self.client.get(url)

    def get_admin_car_washer_wages_export(self):
        url = "{SERVER_DOMAIN}/admin/car_washer_wages/export".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

