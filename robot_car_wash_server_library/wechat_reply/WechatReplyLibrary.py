from robot_car_wash_server_library.common import CommonLibrary


class WechatReplyLibrary(CommonLibrary):
    def post_admin_wechat_replys(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wechat_replys".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("category", "reply_type", "content"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_wechat_replys(self):
        url = "{SERVER_DOMAIN}/admin/wechat_replys".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_wechat_replys_by_wechat_reply_id(self, wechat_reply_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wechat_replys/{wechat_reply_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wechat_reply_id=wechat_reply_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("category", "reply_type", "content"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_wechat_replys_by_wechat_reply_id(self, wechat_reply_id):
        url = "{SERVER_DOMAIN}/admin/wechat_replys/{wechat_reply_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wechat_reply_id=wechat_reply_id)
        return self.client.delete(url)

