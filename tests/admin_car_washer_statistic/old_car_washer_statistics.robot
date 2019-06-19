*** Settings ***
Documentation  admin_car_washer_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_statistic.CarWasherStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer_statistic  虾洗后台


