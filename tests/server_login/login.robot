*** Settings ***
Documentation  server_account
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.common.CommonLibrary
Force Tags  model:server_account  中杆后台

*** Test Cases ***
Login Test
    login  admin_123  88888888

Login Fail
    login  add  ad
