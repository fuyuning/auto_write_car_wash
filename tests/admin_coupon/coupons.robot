*** Settings ***
Documentation  admin_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon.CouponLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon  虾洗后台


*** Test Cases ***
Post Admin Coupon Pools Success 
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Post Admin Coupon Pools Success 201  ${essential_params}  ${unessential_params}

Post Admin Coupon Pools Fail With Wrong Params
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_template_name=${coupon_template_name_422}  discount_money=${discount_money_422}  coupon_number=${coupon_number_422}  allow_gain_number=${allow_gain_number_422}  coupon_type=${coupon_type_422}  is_fixed_time=ThisIsRobot!  allow_use_days=${allow_use_days_422}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types_422}  order_types=${order_types_422}  service_group_ids=${service_group_ids_422}  parking_ids=${parking_ids_422}  
   ${unessential_params}  create list  is_coupon_number_limit=ThisIsRobot!  is_allow_gain_number_limit=ThisIsRobot!  discount=${discount_422}  condition_money=${condition_money_422}  is_point=${is_point_422}  wash_area_ids=${wash_area_ids_422}  
   run every case by params  Post Admin Coupon Pools Fail 422  ${essential_params}  ${unessential_params}

Get coupon Pools point Success 
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get coupon Pools point Success 200  ${essential_params}  ${unessential_params}

Get coupon Pools point Fail With Wrong Params
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_point=${is_point_422}  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get coupon Pools point Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupons Success 
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupons Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupons Fail With Wrong Params
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  coupon_id=${coupon_id_422}  order_no=${order_no_422}  mobile=${mobile_422}  status=${status_422}  car_id=${car_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Coupons Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Pools Success 
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Pools Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Pools Fail With Wrong Params
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  coupon_template_name=${coupon_template_name_422}  status=${status_422}  is_point=${is_point_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Coupon Pools Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Pools By Coupon Pool Id Fail With Wrong Url
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Coupon Pools By Coupon Pool Id Fail 404  coupon_pool_id=${wrong_url_id}

Get Admin Coupon Pools By Coupon Pool Id Success 
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 对象。
   [Tags]           Respcode:200
   Get Admin Coupon Pools By Coupon Pool Id Success 200  coupon_pool_id=${coupon_pool_id}

Put Admin Coupon Pools By Coupon Pool Id Fail With Wrong Params
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_template_name=${coupon_template_name_422}  discount_money=${discount_money_422}  coupon_number=${coupon_number_422}  allow_gain_number=${allow_gain_number_422}  condition_money=${condition_money_422}  is_fixed_time=ThisIsRobot!  allow_use_days=${allow_use_days_422}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types_422}  order_types=${order_types_422}  service_group_ids=${service_group_ids_422}  coupon_type=${coupon_type_422}  parking_ids=${parking_ids_422}  
   ${unessential_params}  create list  is_coupon_number_limit=ThisIsRobot!  is_allow_gain_number_limit=ThisIsRobot!  discount=${discount_422}  is_point=${is_point_422}  wash_area_ids=${wash_area_ids_422}  
   run every case by params  Put Admin Coupon Pools By Coupon Pool Id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Put Admin Coupon Pools By Coupon Pool Id Success 
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put Admin Coupon Pools By Coupon Pool Id Success 204  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Put Admin Coupon Pools By Coupon Pool Id Fail With Wrong Url
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put Admin Coupon Pools By Coupon Pool Id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id=${wrong_url_id}

Delete Admin Coupon Pools By Coupon Pool Id Fail With Wrong Url
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Coupon Pools By Coupon Pool Id Fail 404  coupon_pool_id=${wrong_url_id}

Delete Admin Coupon Pools By Coupon Pool Id Success 
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Coupon Pools By Coupon Pool Id Success 204  coupon_pool_id=${coupon_pool_id}


*** Variables ***
${coupon_pool_id}  


*** Keywords ***
Post Admin Coupon Pools Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Pools   &{kwargs}
   expect status is 201  ${resp}  admin_coupon/Post_Admin_Coupon_Pools_201.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post Admin Coupon Pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Pools   &{kwargs}
   expect status is 422  ${resp}  

Get coupon Pools point Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Pools point   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_coupon_Pools_point_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get coupon Pools point Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Pools point   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupons   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_Coupons_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Admin Coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupons   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_Coupon_Pools_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Admin Coupon Pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Pools By Coupon Pool Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Coupon Pools By Coupon Pool Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_Coupon_Pools_By_Coupon_Pool_Id_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Put Admin Coupon Pools By Coupon Pool Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Coupon Pools By Coupon Pool Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Coupon Pools By Coupon Pool Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Coupon Pools By Coupon Pool Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Coupon Pools By Coupon Pool Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 204  ${resp}  

