*** Settings ***
Documentation  wxmp_refund
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.refund.RefundLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_refund  车主微信端


