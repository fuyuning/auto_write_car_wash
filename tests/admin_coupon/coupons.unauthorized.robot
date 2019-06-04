*** Settings ***
Documentation  admin_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon.CouponLibrary
Force Tags  model:admin_coupon  虾洗后台


*** Test Cases ***
post admin coupon pools Fail Without Login
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin coupon pools fail 403   coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}    is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  

get admin coupon pools point Fail Without Login
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon pools point fail 403   is_point=${is_point}    page_num=${page_num}  page_size=${page_size}  

get admin coupons Fail Without Login
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupons fail 403     coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  

get admin coupon pools Fail Without Login
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon pools fail 403     coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  

get admin coupon pools by coupon pool id Fail Without Login
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon pools by coupon pool id fail 403     coupon_pool_id=${coupon_pool_id}

put admin coupon pools by coupon pool id Fail Without Login
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin coupon pools by coupon pool id fail 403     coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}    is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  

delete admin coupon pools by coupon pool id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon pools by coupon pool id fail 403     coupon_pool_id=${coupon_pool_id}


*** Variables ***
${coupon_pool_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon pools  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon pools point Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools point  &{kwargs}
   expect status is 403  ${resp}  

get admin coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupons  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon pools by coupon pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

put admin coupon pools by coupon pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon pools by coupon pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

