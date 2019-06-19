*** Settings ***
Documentation  wxmp_summon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.summon.SummonLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_summon  车主微信端


