from robot_camera_monitor_deployment_server.common import CommonLibrary


class RecordLibrary(CommonLibrary):
    def get_projects_cameras_identify_records_by_project_id_camera_id(self, project_id, camera_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/identify_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("identify_record_id", "identify_result_id", "spot_num", "vehicle_id", "status", "identify_section", "page_size", "page_num", "order_by"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_projects_cameras_identify_records_by_project_id_camera_id_identify_record_id(self, project_id, camera_id, identify_record_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/identify_records/{identify_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id, identify_record_id=identify_record_id)
        return self.client.get(url)

    def get_projects_cameras_spots_parking_records_by_project_id_camera_id_spot_id(self, project_id, camera_id, spot_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/spots/{spot_id}/parking_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id, spot_id=spot_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("time_point", "car_id", "vehicle_id", "entry_section", "exit_section", "page_size", "page_num", "order_by"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_projects_spot_records_by_project_id(self, project_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/spot_records".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("spot_num", "reg_code", "section", "page_size", "page_num", "order_by"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_projects_cameras_spot_records_by_project_id_camera_id_spot_record_id(self, project_id, camera_id, spot_record_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/spot_records/{spot_record_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id, spot_record_id=spot_record_id)
        return self.client.get(url)

