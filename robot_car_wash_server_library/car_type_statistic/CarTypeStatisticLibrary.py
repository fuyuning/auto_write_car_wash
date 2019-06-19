from robot_car_wash_server_library.common import CommonLibrary


class CarTypeStatisticLibrary(CommonLibrary):
    def get_admin_car_type_statistics(self):
        url = "{SERVER_DOMAIN}/admin/car_type_statistics".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

