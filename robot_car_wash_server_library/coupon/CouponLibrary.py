from robot_car_wash_server_library.common import CommonLibrary


class CouponLibrary(CommonLibrary):
    def post_admin_coupon_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_template_name", "discount_money", "is_coupon_number_limit", "coupon_number", "is_allow_gain_number_limit", "allow_gain_number", "coupon_type", "discount", "condition_money", "is_fixed_time", "allow_use_days", "allow_use_start_time", "allow_use_end_time", "is_point", "service_types", "order_types", "service_group_ids", "wash_area_ids", "parking_ids"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_coupon_pools_point(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_pools/point".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_point", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupons(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", "coupon_id", "order_no", "mobile", "status", "car_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_pools(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_pools".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", "coupon_template_name", "status", "is_point", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_pools_by_coupon_pool_id(self, coupon_pool_id):
        url = "{SERVER_DOMAIN}/admin/coupon_pools/{coupon_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        return self.client.get(url)

    def put_admin_coupon_pools_by_coupon_pool_id(self, coupon_pool_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_pools/{coupon_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_template_name", "discount_money", "is_coupon_number_limit", "coupon_number", "is_allow_gain_number_limit", "allow_gain_number", "discount", "condition_money", "is_fixed_time", "allow_use_days", "allow_use_start_time", "allow_use_end_time", "is_point", "service_types", "order_types", "service_group_ids", "coupon_type", "wash_area_ids", "parking_ids"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_coupon_pools_by_coupon_pool_id(self, coupon_pool_id):
        url = "{SERVER_DOMAIN}/admin/coupon_pools/{coupon_pool_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_pool_id=coupon_pool_id)
        return self.client.delete(url)

