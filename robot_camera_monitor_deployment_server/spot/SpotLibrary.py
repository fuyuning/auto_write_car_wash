from robot_camera_monitor_deployment_server.common import CommonLibrary


class SpotLibrary(CommonLibrary):
    def get_projects_cameras_spots_by_project_id_camera_id(self, project_id, camera_id):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/spots".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id)
        return self.client.get(url)

    def put_projects_cameras_spots_by_project_id_camera_id_spot_id(self, project_id, camera_id, spot_id, **kwargs):
        url = "{SERVER_DOMAIN}/projects/{project_id}/cameras/{camera_id}/spots/{spot_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, project_id=project_id, camera_id=camera_id, spot_id=spot_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("draw_coordinate", ):
                data[k] = v
        return self.client.put(url)

