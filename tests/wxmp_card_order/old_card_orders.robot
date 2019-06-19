*** Settings ***
Documentation  wxmp_card_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_order.CardOrderLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_card_order  车主微信端


