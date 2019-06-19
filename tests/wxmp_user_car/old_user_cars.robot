*** Settings ***
Documentation  wxmp_user_car
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_car.UserCarLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_user_car  车主微信端


