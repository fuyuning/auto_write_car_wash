*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Force Tags  model:wxmp_coupon  车主微信端


*** Test Cases ***
Post coupon Pools achieve Fail Without Login
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Pools achieve Fail 403  ${essential_params}  ${unessential_params}

Post Achieve By Coupon Pool Id Fail Without Login
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Post Achieve By Coupon Pool Id Fail 403  coupon_pool_id/achieve=${coupon_pool_id/achieve}

Get Coupons Usable Fail Without Login
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get Coupons Usable Fail 403  ${essential_params}  ${unessential_params}

Get User Coupon Pools By Coupon Pool Id Fail Without Login
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get User Coupon Pools By Coupon Pool Id Fail 403  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Get Mobile Coupon Pools Fail Without Login
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get Mobile Coupon Pools Fail 403  ${essential_params}  ${unessential_params}

Get User Coupons Fail Without Login
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupons Fail 403  ${essential_params}  ${unessential_params}

Get User Coupon Pools Fail Without Login
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupon Pools Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${coupon_pool_id/achieve_by_mobile}
${coupon_pool_id/achieve}
${coupon_pool_id}


*** Keywords ***
Post coupon Pools achieve Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Pools achieve   &{kwargs}
   expect status is 403  ${resp}  

Post Achieve By Coupon Pool Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Achieve By Coupon Pool Id   &{kwargs}
   expect status is 403  ${resp}  

Get Coupons Usable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Coupons Usable   &{kwargs}
   expect status is 403  ${resp}  

Get User Coupon Pools By Coupon Pool Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 403  ${resp}  

Get Mobile Coupon Pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Mobile Coupon Pools   &{kwargs}
   expect status is 403  ${resp}  

Get User Coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupons   &{kwargs}
   expect status is 403  ${resp}  

Get User Coupon Pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools   &{kwargs}
   expect status is 403  ${resp}  

