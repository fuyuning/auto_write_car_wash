*** Settings ***
Documentation  admin_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon.CouponLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_coupon  虾洗后台


