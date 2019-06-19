*** Settings ***
Documentation  wxmp_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_normal.WashNormalLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_normal  车主微信端


