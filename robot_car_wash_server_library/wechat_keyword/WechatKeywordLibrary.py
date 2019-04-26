from robot_car_wash_server_library.common import CommonLibrary


class WechatKeywordLibrary(CommonLibrary):
    def post_wechat_keyword_import(self):
        url = "{SERVER_DOMAIN}admin/wechat_keyword/import".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.post(url)

    def get_admin_wechat_keywords_by_wechat_keyword_id(self, wechat_keyword_id):
        url = "{SERVER_DOMAIN}/admin/wechat_keywords/{wechat_keyword_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wechat_keyword_id=wechat_keyword_id)
        return self.client.get(url)

