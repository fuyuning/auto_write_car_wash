*** Settings ***
Documentation  wxmp_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon_code.CouponCodeLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_coupon_code  车主微信端


