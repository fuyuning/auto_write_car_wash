*** Settings ***
Documentation  admin_wash_auto_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_auto_group.WashAutoGroupLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_auto_group  虾洗后台


