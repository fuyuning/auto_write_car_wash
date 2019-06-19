*** Settings ***
Documentation  admin_car_series
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_series  虾洗后台


