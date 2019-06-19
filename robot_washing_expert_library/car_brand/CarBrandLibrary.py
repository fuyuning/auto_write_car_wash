from robot_washing_expert_library.common import CommonLibrary


class CarBrandLibrary(CommonLibrary):
    def get_car_wash_car_brands(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/car_brands".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

