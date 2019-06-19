*** Settings ***
Documentation  admin_car_info
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_info.CarInfoLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_info  虾洗后台


