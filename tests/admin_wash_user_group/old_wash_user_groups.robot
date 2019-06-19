*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_group  虾洗后台


