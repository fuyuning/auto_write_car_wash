*** Settings ***
Documentation  admin_car_brand_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand_statistic.CarBrandStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_brand_statistic  虾洗后台


