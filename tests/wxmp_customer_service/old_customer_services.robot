*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_customer_service  车主微信端


