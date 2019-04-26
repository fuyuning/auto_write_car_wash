from robot_car_wash_server_library.common import CommonLibrary


class PromoterLibrary(CommonLibrary):
    def post_admin_promoters(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoters".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("promoter_no", "name", "mobile", "promoter_remark", "enabled"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_promoters(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoters".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "mobile", "promoter_remark"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_promotions(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promotions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("promoter_id", "user_id", "mobile", "car_id", "created_section"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_promotion_count(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promotion_count".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("promoter_id", "created_section"):
                data[k] = v
        return self.client.get(url, params=data)

    def put_admin_promoters_by_promoter_id(self, promoter_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoters/{promoter_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, promoter_id=promoter_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "mobile", "promoter_remark", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_enabled_by_promoter_id(self, promoter_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/promoters/{promoter_id}/enabled".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, promoter_id=promoter_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url)

    def delete_admin_promoters_by_promoter_id(self, promoter_id):
        url = "{SERVER_DOMAIN}/admin/promoters/{promoter_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, promoter_id=promoter_id)
        return self.client.delete(url)

