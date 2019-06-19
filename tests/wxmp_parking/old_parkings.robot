*** Settings ***
Documentation  wxmp_parking
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.parking.ParkingLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_parking  车主微信端


