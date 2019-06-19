*** Settings ***
Documentation  wxmp_service_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.service_group.ServiceGroupLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_service_group  车主微信端


