from robot_car_wash_server_library.common import CommonLibrary


class LinePromotionLibrary(CommonLibrary):
    def get_admin_line_promotions(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/line_promotions".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "sex", "car_status", "wash_area_id", "wash_status", "user_tag", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_line_promotions_by_lpr_id(self, lpr_id):
        url = "{SERVER_DOMAIN}/admin/line_promotions/{lpr_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lpr_id=lpr_id)
        return self.client.get(url)

    def delete_admin_line_promotions_by_lpr_id(self, lpr_id):
        url = "{SERVER_DOMAIN}/admin/line_promotions/{lpr_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, lpr_id=lpr_id)
        return self.client.delete(url)

