from robot_car_wash_server_library.common import CommonLibrary


class CouponLibrary(CommonLibrary):
    def post_coupon_pools_achieve(self, **kwargs):
        url = "{SERVER_DOMAIN}user/coupon_pools/achieve".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_ids", ):
                data[k] = v
        return self.client.post(url)

    def post_achieve_by_mobile_by_coupon_pool_id(self, coupon_pool_id, **kwargs):
        url = "{SERVER_DOMAIN}coupon_pools/{coupon_pool_id}/achieve_by_mobile".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("client_id", "secret", "mobile", "serie", "captcha"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_achieve_by_coupon_pool_id(self, coupon_pool_id):
        url = "{SERVER_DOMAIN}coupon_pools/{coupon_pool_id}/achieve".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        return self.client.post(url)

    def get_coupons_usable(self, **kwargs):
        url = "{SERVER_DOMAIN}user/coupons/usable".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", "service_group_id", "parking_id", "order_type", "service_type", "order_price"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_coupon_pools_by_coupon_pool_id(self, coupon_pool_id, **kwargs):
        url = "{SERVER_DOMAIN}user/coupon_pools/{coupon_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_point", ):
                data[k] = v
        return self.client.get(url)

    def get_mobile_coupon_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}mobile/coupon_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_coupons(self, **kwargs):
        url = "{SERVER_DOMAIN}user/coupons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("status", "section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_user_coupon_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}user/coupon_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("section", "page_limit"):
                data[k] = v
        return self.client.get(url, params=data)

