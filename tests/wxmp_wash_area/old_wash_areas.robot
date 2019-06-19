*** Settings ***
Documentation  wxmp_wash_area
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_area.WashAreaLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_area  车主微信端


