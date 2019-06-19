from robot_washing_expert_library.common import CommonLibrary


class ParkingLibrary(CommonLibrary):
    def get_car_wash_parkings(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/parkings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", "condition"):
                data[k] = v
        return self.client.get(url, params=data)

