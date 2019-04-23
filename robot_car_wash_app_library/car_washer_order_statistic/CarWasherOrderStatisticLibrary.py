from robot_car_wash_server_library.common import CommonLibrary


class CarWasherOrderStatisticLibrary(CommonLibrary):
    def get_car_washer_order_statistic_by_car_washer_order_statistic_id(self, car_washer_order_statistic_id, **kwargs):
        url = "{SERVER_DOMAIN}/car_washer_order_statistic/{car_washer_order_statistic_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, car_washer_order_statistic_id=car_washer_order_statistic_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("mouth", ):
                data[k] = v
        return self.client.get(url)

