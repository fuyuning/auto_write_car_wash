*** Settings ***
Documentation  admin_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.service.ServiceLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_service  虾洗后台


