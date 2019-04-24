from robot_car_wash_app_library.common import CommonLibrary


class ParkingCouponLibrary(CommonLibrary):
    def post_car_wash_parking_coupons(self, **kwargs):
        url = "{SERVER_DOMAIN}/car_wash/parking_coupons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("parking_id", "car_id", "parking_coupon_no"):
                data[k] = v
        return self.client.post(url, json=data)

