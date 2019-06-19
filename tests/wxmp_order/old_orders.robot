*** Settings ***
Documentation  wxmp_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.order.OrderLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_order  车主微信端


