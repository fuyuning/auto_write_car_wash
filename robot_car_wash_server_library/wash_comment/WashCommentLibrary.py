from robot_car_wash_server_library.common import CommonLibrary


class WashCommentLibrary(CommonLibrary):
    def get_admin_wash_comments(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/wash_comments".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("order_no", "user_id", "car_id", "mobile", "level", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_wash_comments_by_comment_id(self, comment_id):
        url = "{SERVER_DOMAIN}/admin/wash_comments/{comment_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, comment_id=comment_id)
        return self.client.delete(url)

