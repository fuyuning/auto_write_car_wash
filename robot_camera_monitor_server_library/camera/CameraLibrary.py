from robot_camera_monitor_server_library.common import CommonLibrary


class CameraLibrary(CommonLibrary):
    def get_projects_cameras_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("reg_code", "work_status", "network_status", "camera_brand_id", "camera_model_id", "draw_status", "spot_num", "page_size", "page_num", "order_by"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_projects_cameras_images_by_project_id_camera_id(self, project_id, camera_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/images".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("page_size", "page_num"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_projects_cameras_by_project_id_camera_id(self, project_id, camera_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        return self.client.get(url, params=data)

    def get_projects_camera_brands_by_project_id(self, project_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/camera_brands".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        return self.client.get(url, params=data)

    def get_projects_camera_brands_camera_models_by_project_id_camera_brand_id(self, project_id, camera_brand_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/camera_brands/{camera_brand_id}/camera_models".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_brand_id=camera_brand_id)
        return self.client.get(url, params=data)

    def put_projects_cameras_by_project_id_camera_id(self, project_id, camera_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("work_time", "upload_cycle", "reg_code"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_projects_cameras_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("work_time", "upload_cycle", "camera_ids"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_projects_cameras_by_project_id_camera_id(self, project_id, camera_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("work_status", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def patch_projects_cameras_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("work_status", "camera_ids"):
                data[k] = v
        return self.client.patch(url, json=data)

