from robot_camera_monitor_server_library.common import CommonLibrary


class ProjectLibrary(CommonLibrary):
    def post_projects_import(self, **kwargs):
        url = "{SERVER_DOMAIN}/projects/import".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("file", ):
                data[k] = v
        return self.client.post(url, json=data)

    def post_projects_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("file", ):
                data[k] = v
        return self.client.post(url, json=data)

    def get_projects(self, **kwargs):
        url = "{SERVER_DOMAIN}/projects".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("project_name", "page_size", "page_num", "order_by"):
                data[k] = v
        return self.client.get(url, params=data)

    def patch_projects_upload_platforms_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/upload_platforms".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("upload_platforms", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_projects_by_project_id(self, project_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        return self.client.delete(url, )

