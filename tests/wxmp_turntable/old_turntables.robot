*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_turntable  车主微信端


