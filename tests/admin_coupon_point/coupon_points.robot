*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
post admin coupon point autos Success 
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_price_last_30_day=${average_price_last_30_day}  wash_interval=${wash_interval}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_price_last_30_day=False  is_wash_interval=False  enable=False  
   run every case by params  post admin coupon point autos Success 200  ${essential_params}  ${unessential_params}

post admin coupon point autos Fail With Wrong Params
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  record_num_last_30_day=${record_num_last_30_day_422}  average_price_last_30_day=${average_price_last_30_day_422}  wash_interval=${wash_interval_422}  user_type=${user_type_422}  
   ${unessential_params}  create list  is_record_num_last_30_day=ThisIsRobot!  is_average_price_last_30_day=ThisIsRobot!  is_wash_interval=ThisIsRobot!  enable=ThisIsRobot!  
   run every case by params  post admin coupon point autos Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin coupon point records Fail With Wrong Params
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  user_ids=${user_ids_422}  coupon_pool_id=${coupon_pool_id_422}  
   ${unessential_params}  create list  
   run every case by params  post admin coupon point records Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin coupon point records Success 
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  post admin coupon point records Success 200  ${essential_params}  ${unessential_params}

post admin coupon point records upload Success 
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  post admin coupon point records upload Success 200  ${essential_params}  ${unessential_params}

post admin coupon point records upload Fail With Wrong Params
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  
   ${unessential_params}  create list  
   run every case by params  post admin coupon point records upload Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon point autos Success 
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointAuto 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon point autos Success 200  ${essential_params}  ${unessential_params}

get admin coupon point autos Fail With Wrong Params
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin coupon point autos Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon point records Success 
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon point records Success 200  ${essential_params}  ${unessential_params}

get admin coupon point records Fail With Wrong Params
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name_422}  point_remark=${point_remark_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin coupon point records Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon points Success 
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPoint 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon points Success 200  ${essential_params}  ${unessential_params}

get admin coupon points Fail With Wrong Params
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id_422}  
   ${unessential_params}  create list  user_id=${user_id_422}  mobile=${mobile_422}  status=${status_422}  is_used=${is_used_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin coupon points Fail 422  ${essential_params}  ${unessential_params}  success=False

patch admin coupon point autos enable by coupon point auto id Success 
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=False  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Success 204  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}

patch admin coupon point autos enable by coupon point auto id Fail With Wrong Url
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=False  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Fail 404  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${wrong_url_id}  coupon_point_record_id=${wrong_url_id}

patch admin coupon point autos enable by coupon point auto id Fail With Wrong Params
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=ThisIsRobot!  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Fail 422  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}  success=False

patch admin coupon point records by coupon point record id Success 
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  patch admin coupon point records by coupon point record id Success 204  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}

patch admin coupon point records by coupon point record id Fail With Wrong Url
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  patch admin coupon point records by coupon point record id Fail 404  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${wrong_url_id}  coupon_point_record_id=${wrong_url_id}

patch admin coupon point records by coupon point record id Fail With Wrong Params
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark_422}  
   run every case by params  patch admin coupon point records by coupon point record id Fail 422  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}  success=False

delete admin coupon point autos by coupon point auto id Fail With Wrong Url
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin coupon point autos by coupon point auto id Fail 404    coupon_point_auto_id=${wrong_url_id}  coupon_point_record_id=${wrong_url_id}

delete admin coupon point autos by coupon point auto id Success 
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin coupon point autos by coupon point auto id Success 204    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}

delete admin coupon point records by coupon point record id Fail With Wrong Url
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin coupon point records by coupon point record id Fail 404    coupon_point_auto_id=${wrong_url_id}  coupon_point_record_id=${wrong_url_id}

delete admin coupon point records by coupon point record id Success 
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin coupon point records by coupon point record id Success 204    coupon_point_auto_id=${coupon_point_auto_id}  coupon_point_record_id=${coupon_point_record_id}


*** Variables ***
${coupon_point_auto_id}  
${coupon_point_record_id}  


*** Keywords ***
post admin coupon point autos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point autos  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/post_admin_coupon_point_autos_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

post admin coupon point autos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point autos  &{kwargs}
   expect status is 422  ${resp}  

post admin coupon point records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records  &{kwargs}
   expect status is 422  ${resp}  

post admin coupon point records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/post_admin_coupon_point_records_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

post admin coupon point records upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records upload  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/post_admin_coupon_point_records_upload_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

post admin coupon point records upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records upload  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon point autos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point autos  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/get_admin_coupon_point_autos_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

get admin coupon point autos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point autos  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon point records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/get_admin_coupon_point_records_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

get admin coupon point records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon points Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/get_admin_coupon_points_200.json
   ${coupon_point_auto_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_auto_id]}
   set global variable   ${coupon_point_auto_id}
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

get admin coupon points Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points  &{kwargs}
   expect status is 422  ${resp}  

patch admin coupon point autos enable by coupon point auto id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 204  ${resp}  

patch admin coupon point autos enable by coupon point auto id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 404  ${resp}  

patch admin coupon point autos enable by coupon point auto id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 422  ${resp}  

patch admin coupon point records by coupon point record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin coupon point records by coupon point record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin coupon point records by coupon point record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 422  ${resp}  

delete admin coupon point autos by coupon point auto id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 404  ${resp}  

delete admin coupon point autos by coupon point auto id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 204  ${resp}  

delete admin coupon point records by coupon point record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 404  ${resp}  

delete admin coupon point records by coupon point record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 204  ${resp}  

