*** Settings ***
Documentation  admin_service_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.service_group.ServiceGroupLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_service_group  虾洗后台


