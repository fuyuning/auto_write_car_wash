*** Settings ***
Documentation  admin_parking_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_statistic.ParkingStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_parking_statistic  虾洗后台


