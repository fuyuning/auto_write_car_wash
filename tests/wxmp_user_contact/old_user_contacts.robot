*** Settings ***
Documentation  wxmp_user_contact
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_contact.UserContactLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_user_contact  车主微信端


