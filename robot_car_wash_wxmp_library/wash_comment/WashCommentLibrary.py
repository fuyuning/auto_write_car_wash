from robot_car_wash_wxmp_library.common import CommonLibrary


class WashCommentLibrary(CommonLibrary):
    def post_user_wash_comments(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/wash_comments".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_record_id", "car_images", "level", "comment_remark"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_wash_comments_by_wash_record_id(self, wash_record_id):
        url = "{SERVER_DOMAIN}/user/wash_comments/{wash_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, wash_record_id=wash_record_id)
        return self.client.get(url)

    def get_image_upload(self, **kwargs):
        url = "{SERVER_DOMAIN}/wechat/image/upload".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("media_id", ):
                data[k] = v
        return self.client.get(url)

