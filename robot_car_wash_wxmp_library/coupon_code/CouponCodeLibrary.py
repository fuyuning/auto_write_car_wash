from robot_car_wash_wxmp_library.common import CommonLibrary


class CouponCodeLibrary(CommonLibrary):
    def post_coupons_achieve_by_code(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/coupons/achieve_by_code".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_code_no", ):
                data[k] = v
        return self.client.post(url)

