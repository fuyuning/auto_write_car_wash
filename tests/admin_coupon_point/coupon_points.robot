*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
Post coupon_point Fail Without Login
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_last_30_day=${average_last_30_day}  how_long_no_record=${how_long_no_record}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_last_30_day=False  is_how_long_no_record=False  enable=False  
   run every case by params  Post admin coupon point automatic records Fail 403  ${essential_params}  ${unessential_params}



Post coupon_point Success 
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_last_30_day=${average_last_30_day}  how_long_no_record=${how_long_no_record}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_last_30_day=False  is_how_long_no_record=False  enable=False  
   run every case by params  Post admin coupon point automatic records Success 200  ${essential_params}  ${unessential_params}



Post coupon_point Fail With Wrong Params
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_last_30_day=${average_last_30_day}  how_long_no_record=${how_long_no_record}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_last_30_day=False  is_how_long_no_record=False  enable=False  
   run every case by params  Post admin coupon point automatic records Fail 422  ${essential_params}  ${unessential_params}



Post coupon_point Fail Without Login
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon point records Fail 403  ${essential_params}  ${unessential_params}



Post coupon_point Fail With Wrong Params
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon point records Fail 422  ${essential_params}  ${unessential_params}



Post coupon_point Success 
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon point records Success 200  ${essential_params}  ${unessential_params}



Post coupon_point Fail Without Login
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon point records upload Fail 403  ${essential_params}  ${unessential_params}



Post coupon_point Fail With Wrong Url
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon point records upload Fail 404  ${essential_params}  ${unessential_params}



Post coupon_point Success 
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon point records upload Success 200  ${essential_params}  ${unessential_params}



Post coupon_point Fail With Wrong Params
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon point records upload Fail 422  ${essential_params}  ${unessential_params}



Get coupon_point Fail Without Login
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point automatic records Fail 403  ${essential_params}  ${unessential_params}



Get coupon_point Success 
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointAutomaticRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point automatic records Success 200  ${essential_params}  ${unessential_params}



Get coupon_point Fail With Wrong Params
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point automatic records Fail 422  ${essential_params}  ${unessential_params}



Get coupon_point Fail Without Login
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point records Fail 403  ${essential_params}  ${unessential_params}



Get coupon_point Success 
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point records Success 200  ${essential_params}  ${unessential_params}



Get coupon_point Fail With Wrong Params
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon point records Fail 422  ${essential_params}  ${unessential_params}



Get coupon_point Fail Without Login
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon points Fail 403  ${essential_params}  ${unessential_params}



Get coupon_point Success 
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPoint 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon points Success 200  ${essential_params}  ${unessential_params}



Get coupon_point Fail With Wrong Params
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin coupon points Fail 422  ${essential_params}  ${unessential_params}



Patch coupon_point By Id Success 
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch admin coupon point records By Id Success 204  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}



Patch coupon_point By Id Fail Without Login
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch admin coupon point records By Id Fail 403  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}



Patch coupon_point By Id Fail With Wrong Url
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch admin coupon point records By Id Fail 404  ${essential_params}  ${unessential_params}  coupon_point_record_id=${wrong_url_id}



Patch coupon_point By Id Fail With Wrong Params
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch admin coupon point records By Id Fail 422  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}



Delete coupon_point By Id Success 
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin coupon point records By Id Success 204  coupon_point_record_id=${coupon_point_record_id}



Delete coupon_point By Id Fail With Wrong Url
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin coupon point records By Id Fail 404  coupon_point_record_id=${wrong_url_id}



Delete coupon_point By Id Fail Without Login
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin coupon point records By Id Fail 403  coupon_point_record_id=${coupon_point_record_id}



*** Variables ***
${coupon_point_record_id}


*** Keywords ***
Post Admin coupon point automatic records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point automatic records   &{kwargs}
   expect status is 403  ${resp}  

Post Admin coupon point automatic records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point automatic records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_Admin_coupon_point_automatic_records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post Admin coupon point automatic records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point automatic records   &{kwargs}
   expect status is 422  ${resp}  

Post Admin coupon point records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records   &{kwargs}
   expect status is 403  ${resp}  

Post Admin coupon point records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records   &{kwargs}
   expect status is 422  ${resp}  

Post Admin coupon point records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_Admin_coupon_point_records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post Coupon point records upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post coupon point records upload   &{kwargs}
   expect status is 403  ${resp}  

Post Coupon point records upload Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post coupon point records upload   &{kwargs}
   expect status is 404  ${resp}  

Post Coupon point records upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post coupon point records upload   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_Coupon_point_records_upload_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post Coupon point records upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post coupon point records upload   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon point automatic records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point automatic records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon point automatic records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point automatic records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_coupon_point_automatic_records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin coupon point automatic records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point automatic records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon point records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon point records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_coupon_point_records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin coupon point records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon points Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon points Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_coupon_points_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin coupon points Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin coupon point records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin coupon point records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin coupon point records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin coupon point records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 422  ${resp}  

Delete Admin coupon point records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin coupon point records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin coupon point records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 403  ${resp}  

