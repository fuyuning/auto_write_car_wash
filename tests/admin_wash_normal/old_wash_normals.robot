*** Settings ***
Documentation  admin_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_normal.WashNormalLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_normal  虾洗后台


