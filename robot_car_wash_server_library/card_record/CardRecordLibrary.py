from robot_car_wash_server_library.common import CommonLibrary


class CardRecordLibrary(CommonLibrary):
    def get_admin_card_records(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/card_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("user_id", "mobile", "mode", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_card_records_by_card_record_id(self, card_record_id):
        url = "{SERVER_DOMAIN}/admin/card_records/{card_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_record_id=card_record_id)
        return self.client.delete(url)

