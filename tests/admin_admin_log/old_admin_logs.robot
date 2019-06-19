*** Settings ***
Documentation  admin_admin_log
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_log.AdminLogLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_admin_log  虾洗后台


