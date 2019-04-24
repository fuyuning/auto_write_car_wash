*** Settings ***
Documentation  wxmp_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon_code.CouponCodeLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_coupon_code  车主微信端


*** Test Cases ***
Post Coupons Achieve By Code Success 
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_code_no=${coupon_code_no}  
   ${unessential_params}  create list  
   run every case by params  Post Coupons Achieve By Code Success 204  ${essential_params}  ${unessential_params}

Post Coupons Achieve By Code Fail With Wrong Params
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_code_no=${coupon_code_no}  
   ${unessential_params}  create list  
   run every case by params  Post Coupons Achieve By Code Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Coupons Achieve By Code Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Coupons Achieve By Code   &{kwargs}
   expect status is 204  ${resp}  

Post Coupons Achieve By Code Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Coupons Achieve By Code   &{kwargs}
   expect status is 422  ${resp}  

