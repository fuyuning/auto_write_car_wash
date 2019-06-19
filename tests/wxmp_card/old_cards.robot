*** Settings ***
Documentation  wxmp_card
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card.CardLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_card  车主微信端


