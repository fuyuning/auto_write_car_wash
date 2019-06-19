*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_user  车主微信端


