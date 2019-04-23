*** Settings ***
Documentation  admin_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon.CouponLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon  虾洗后台


*** Test Cases ***
Post coupon Fail Without Login
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Post admin coupon pools Fail 403  ${essential_params}  ${unessential_params}



Post coupon Success 
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Post admin coupon pools Success 201  ${essential_params}  ${unessential_params}



Post coupon Fail With Wrong Params
   [Documentation]  接口名:添加优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  coupon_type=${coupon_type}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  condition_money=${condition_money}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Post admin coupon pools Fail 422  ${essential_params}  ${unessential_params}



Get coupon Fail Without Login
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get coupon pools point Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get coupon pools point Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:定向优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get coupon pools point Fail 422  ${essential_params}  ${unessential_params}



Get coupon Fail Without Login
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupons Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupons Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:发放记录(已领取的优惠券列表)${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_id=${coupon_id}  order_no=${order_no}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupons Fail 422  ${essential_params}  ${unessential_params}



Get coupon Fail Without Login
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon pools Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon pools Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_pool_id=${coupon_pool_id}  coupon_template_name=${coupon_template_name}  status=${status}  is_point=${is_point}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon pools Fail 422  ${essential_params}  ${unessential_params}



Get coupon By Id Fail With Wrong Url
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin coupon pools By Id Fail 404  coupon_pool_id=${wrong_url_id}



Get coupon By Id Fail Without Login
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin coupon pools By Id Fail 403  coupon_pool_id=${coupon_pool_id}



Get coupon By Id Success 
   [Documentation]  接口名:优惠券详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 对象。
   [Tags]           Respcode:200
   Get admin coupon pools By Id Success 200  coupon_pool_id=${coupon_pool_id}



Put coupon By Id Success 
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put admin coupon pools By Id Success 204  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Put coupon By Id Fail With Wrong Params
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put admin coupon pools By Id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Put coupon By Id Fail Without Login
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put admin coupon pools By Id Fail 403  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Put coupon By Id Fail With Wrong Url
   [Documentation]  接口名:编辑优惠券${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  coupon_template_name=${coupon_template_name}  discount_money=${discount_money}  coupon_number=${coupon_number}  allow_gain_number=${allow_gain_number}  condition_money=${condition_money}  is_fixed_time=False  allow_use_days=${allow_use_days}  allow_use_start_time=${Please_input}  allow_use_end_time=${Please_input}  service_types=${service_types}  order_types=${order_types}  service_group_ids=${service_group_ids}  coupon_type=${coupon_type}  parking_ids=${parking_ids}  
   ${unessential_params}  create list  is_coupon_number_limit=False  is_allow_gain_number_limit=False  discount=${discount}  is_point=${is_point}  wash_area_ids=${wash_area_ids}  
   run every case by params  Put admin coupon pools By Id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id=${wrong_url_id}



Delete coupon By Id Success 
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin coupon pools By Id Success 204  coupon_pool_id=${coupon_pool_id}



Delete coupon By Id Fail With Wrong Url
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin coupon pools By Id Fail 404  coupon_pool_id=${wrong_url_id}



Delete coupon By Id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin coupon pools By Id Fail 403  coupon_pool_id=${coupon_pool_id}



*** Variables ***
${coupon_pool_id}


*** Keywords ***
Post Admin coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon pools   &{kwargs}
   expect status is 403  ${resp}  

Post Admin coupon pools Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon pools   &{kwargs}
   expect status is 201  ${resp}  admin_coupon/Post_Admin_coupon_pools_201.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post Admin coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon pools   &{kwargs}
   expect status is 422  ${resp}  

Get Coupon pools point Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get coupon pools point   &{kwargs}
   expect status is 403  ${resp}  

Get Coupon pools point Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get coupon pools point   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Coupon_pools_point_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Coupon pools point Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get coupon pools point   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupons   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupons   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_coupons_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Admin coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupons   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools   &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_coupon_pools_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Admin coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin coupon pools By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon pools By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon pools by coupon pool id  &{kwargs}
   expect status is 200  ${resp}  admin_coupon/Get_Admin_coupon_pools_By_Id_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Put Admin coupon pools By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon pools by coupon pool id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin coupon pools By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon pools by coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin coupon pools By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon pools by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin coupon pools By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon pools by coupon pool id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon pools by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin coupon pools By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

