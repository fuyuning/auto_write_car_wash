*** Settings ***
Documentation  wxmp_car_brand
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_brand.CarBrandLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_car_brand  车主微信端


