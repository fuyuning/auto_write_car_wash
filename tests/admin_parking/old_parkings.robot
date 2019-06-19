*** Settings ***
Documentation  admin_parking
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking.ParkingLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_parking  虾洗后台


