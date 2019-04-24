*** Settings ***
Documentation  wxmp_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon_code.CouponCodeLibrary
Force Tags  model:wxmp_coupon_code  车主微信端


*** Test Cases ***
Post Coupons Achieve By Code Fail Without Login
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_code_no=${coupon_code_no}  
   ${unessential_params}  create list  
   run every case by params  Post Coupons Achieve By Code Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Coupons Achieve By Code Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Coupons Achieve By Code   &{kwargs}
   expect status is 403  ${resp}  

