from robot_car_wash_server_library.common import CommonLibrary


class CouponCodeLibrary(CommonLibrary):
    def post_admin_coupon_code_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_code_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", "created_number", "is_new_user"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_coupon_code_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_code_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_code_name", "coupon_code_remark", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_codes(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_codes".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_code_record_id", "coupon_code_no", "user_id", "mobile", "status", "car_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_codes_export_by_coupon_code_record_id(self, coupon_code_record_id):
        url = "{SERVER_DOMAIN}/admin/coupon_codes/export/{coupon_code_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_code_record_id=coupon_code_record_id)
        return self.client.get(url)

    def patch_admin_coupon_code_records_remark_by_coupon_code_record_id(self, coupon_code_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_code_records/{coupon_code_record_id}/remark".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_code_record_id=coupon_code_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_code_remark", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_coupon_code_records_by_coupon_code_record_id(self, coupon_code_record_id):
        url = "{SERVER_DOMAIN}/admin/coupon_code_records/{coupon_code_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_code_record_id=coupon_code_record_id)
        return self.client.delete(url)

