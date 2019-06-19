*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_login  车主微信端


