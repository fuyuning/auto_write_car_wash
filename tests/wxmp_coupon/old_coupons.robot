*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_coupon  车主微信端


