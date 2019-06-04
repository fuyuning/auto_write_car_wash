*** Settings ***
Documentation  wxmp_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon_code.CouponCodeLibrary
Force Tags  model:wxmp_coupon_code  车主微信端


*** Test Cases ***
post user coupons achieve by code Fail Without Login
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user coupons achieve by code fail 403   coupon_code_no=${coupon_code_no}    


*** Keywords ***
post user coupons achieve by code Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user coupons achieve by code  &{kwargs}
   expect status is 403  ${resp}  

