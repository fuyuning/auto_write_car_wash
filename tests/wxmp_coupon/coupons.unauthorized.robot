*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Force Tags  model:wxmp_coupon  车主微信端


*** Test Cases ***
post user coupon pools achieve Fail Without Login
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user coupon pools achieve fail 403   coupon_pool_ids=${coupon_pool_ids}    

post coupon pools achieve by coupon pool id Fail Without Login
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post coupon pools achieve by coupon pool id fail 403     coupon_pool_id=${coupon_pool_id}

get user coupons usable Fail Without Login
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user coupons usable fail 403   order_price=${order_price}    wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  

get user coupon pools by coupon pool id Fail Without Login
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user coupon pools by coupon pool id fail 403     coupon_pool_id=${coupon_pool_id}  is_point=${is_point}    

get user coupons Fail Without Login
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user coupons fail 403   status=${status}    section=${section}  page_limit=${page_limit}  

get user coupon pools Fail Without Login
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user coupon pools fail 403     section=${section}  page_limit=${page_limit}  


*** Variables ***
${coupon_pool_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post user coupon pools achieve Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user coupon pools achieve  &{kwargs}
   expect status is 403  ${resp}  

post coupon pools achieve by coupon pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

get user coupons usable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons usable  &{kwargs}
   expect status is 403  ${resp}  

get user coupon pools by coupon pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

get user coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons  &{kwargs}
   expect status is 403  ${resp}  

get user coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools  &{kwargs}
   expect status is 403  ${resp}  

