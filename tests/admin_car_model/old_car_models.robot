*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_model  虾洗后台


