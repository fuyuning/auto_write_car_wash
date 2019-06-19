from robot_car_wash_server_library.common import CommonLibrary


class CarBrandLibrary(CommonLibrary):
    def get_admin_car_brands(self):
        url = "{SERVER_DOMAIN}/admin/car_brands".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

