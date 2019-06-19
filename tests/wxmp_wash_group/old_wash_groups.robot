*** Settings ***
Documentation  wxmp_wash_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_group.WashGroupLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_group  车主微信端


