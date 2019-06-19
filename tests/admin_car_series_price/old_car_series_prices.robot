*** Settings ***
Documentation  admin_car_series_price
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series_price.CarSeriesPriceLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_series_price  虾洗后台


