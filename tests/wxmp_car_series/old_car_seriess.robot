*** Settings ***
Documentation  wxmp_car_series
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_series.CarSeriesLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_car_series  车主微信端


