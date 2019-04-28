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
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  post user coupon pools achieve Fail 403  ${essential_params}  ${unessential_params}

post coupon pools achieve by coupon pool id Fail Without Login
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post coupon pools achieve by coupon pool id Fail 403    coupon_pool_id=${coupon_pool_id}

get user coupons usable Fail Without Login
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  get user coupons usable Fail 403  ${essential_params}  ${unessential_params}

get user coupon pools by coupon pool id Fail Without Login
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  get user coupon pools by coupon pool id Fail 403  ${essential_params}  ${unessential_params}    coupon_pool_id=${coupon_pool_id}

get mobile coupon pools Fail Without Login
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get mobile coupon pools Fail 403  ${essential_params}  ${unessential_params}

get user coupons Fail Without Login
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get user coupons Fail 403  ${essential_params}  ${unessential_params}

get user coupon pools Fail Without Login
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get user coupon pools Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${coupon_pool_id}  12345678909876543


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

get mobile coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools  &{kwargs}
   expect status is 403  ${resp}  

get user coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons  &{kwargs}
   expect status is 403  ${resp}  

get user coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools  &{kwargs}
   expect status is 403  ${resp}  

