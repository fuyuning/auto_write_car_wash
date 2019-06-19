*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_point  虾洗后台


