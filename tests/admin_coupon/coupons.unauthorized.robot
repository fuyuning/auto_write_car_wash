*** Settings ***
Documentation  admin_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon.CouponLibrary
Force Tags  model:admin_coupon  虾洗后台


*** Test Cases ***
Post Admin Coupon Pools Fail Without Login
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Post Admin Coupon Pools Fail 403  ${essential_params}  ${unessential_params}

Get coupon Pools point Fail Without Login
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get coupon Pools point Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupons Fail Without Login
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupons Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Pools Fail Without Login
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Pools Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Pools By Coupon Pool Id Fail Without Login
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Coupon Pools By Coupon Pool Id Fail 403  coupon_pool_id=${coupon_pool_id}

Put Admin Coupon Pools By Coupon Pool Id Fail Without Login
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put Admin Coupon Pools By Coupon Pool Id Fail 403  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Delete Admin Coupon Pools By Coupon Pool Id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Coupon Pools By Coupon Pool Id Fail 403  coupon_pool_id=${coupon_pool_id}


*** Variables ***
${coupon_pool_id}


*** Keywords ***
Post Admin Coupon Pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Pools   &{kwargs}
   expect status is 403  ${resp}  

Get coupon Pools point Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Pools point   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupons   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Pools By Coupon Pool Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Coupon Pools By Coupon Pool Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Coupon Pools By Coupon Pool Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 403  ${resp}  

