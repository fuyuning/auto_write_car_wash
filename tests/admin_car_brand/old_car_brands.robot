*** Settings ***
Documentation  admin_car_brand
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand.CarBrandLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_brand  虾洗后台


