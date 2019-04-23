from robot_car_wash_server_library.common import CommonLibrary


class WashRecordLibrary(CommonLibrary):
    def post_refund_by_wash_record_id(self, wash_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}/refund".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("refunds", "refund_description"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_close_by_wash_record_id(self, wash_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}/close".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("close_description", ):
                data[k] = v
        return self.client.post(url)

    def get_admin_wash_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_no", "status", "car_id", "mobile", "wash_area_id", "submit_section", "user_id", "wash_seconds", "page_num", "page_size", "order_type", "is_deleted"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_wash_records_by_wash_record_id(self, wash_record_id):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        return self.client.get(url)

    def patch_is_deleted_by_wash_record_id(self, wash_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}/is_deleted".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("is_deleted", ):
                data[k] = v
        return self.client.patch(url)

    def patch_admin_wash_record_by_wash_record_id(self, wash_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_record/{wash_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("admin_remark", ):
                data[k] = v
        return self.client.patch(url)

    def patch_(car_id|mobile|name)_by_wash_record_id(self, wash_record_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}/(car_id|mobile|name)".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "mobile", "name"):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_wash_records_by_wash_record_id(self, wash_record_id):
        url = "{SERVER_DOMAIN}/admin/wash_records/{wash_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        return self.client.delete(url)

