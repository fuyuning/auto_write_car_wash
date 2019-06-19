*** Settings ***
Documentation  wxmp_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.lucky_flop.LuckyFlopLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_lucky_flop  车主微信端


