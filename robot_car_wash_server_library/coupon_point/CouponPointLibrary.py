from robot_car_wash_server_library.common import CommonLibrary


class CouponPointLibrary(CommonLibrary):
    def post_admin_coupon_point_autos(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_autos".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", "record_num_last_30_day", "is_record_num_last_30_day", "average_price_last_30_day", "is_average_price_last_30_day", "wash_interval", "is_wash_interval", "enable", "user_type"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_admin_coupon_point_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_ids", "coupon_pool_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_coupon_point_records_upload(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_records/upload".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", ):
                data[k] = v
        return self.client.post(url)

    def get_admin_coupon_point_autos(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_autos".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_name", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_point_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_id", "mobile", "status", "is_used", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_points(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_points".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_point_record_id", "coupon_name", "point_remark", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_coupon_point_records_by_coupon_point_record_id(self, coupon_point_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_records/{coupon_point_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_point_record_id=coupon_point_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("point_remark", ):
                data[k] = v
        return self.client.patch(url)

    def delete_admin_coupon_point_records_by_coupon_point_record_id(self, coupon_point_record_id):
        url = "{SERVER_DOMAIN}/admin/coupon_point_records/{coupon_point_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_point_record_id=coupon_point_record_id)
        return self.client.delete(url)

