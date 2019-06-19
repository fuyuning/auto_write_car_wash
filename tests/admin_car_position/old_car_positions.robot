*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_position  虾洗后台


