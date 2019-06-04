from robot_car_wash_server_library.common import CommonLibrary


class NoticeMailLibrary(CommonLibrary):
    def post_admin_notice_mails(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/notice_mails".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("notice_mail", "comment_status", "money_status", "car_move_qrcode_status", "wxmp_remark_status", "washer_remark_status"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_notice_mails(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/notice_mails".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_admin_notice_mails_(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)_by_notice_mail_id(self, notice_mail_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/notice_mails/{notice_mail_id}/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, notice_mail_id=notice_mail_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("comment_status", "money_status", "car_move_qrcode_status", "wxmp_remark_status", "washer_remark_status"):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_notice_mails_by_notice_mail_id(self, notice_mail_id):
        url = "{SERVER_DOMAIN}/admin/notice_mails/{notice_mail_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, notice_mail_id=notice_mail_id)
        return self.client.delete(url)

