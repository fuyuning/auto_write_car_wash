*** Settings ***
Documentation  admin_wash_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_group.WashGroupLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_group  虾洗后台


