*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
Post Admin Coupon Point Autos Success 
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_price_last_30_day=${average_price_last_30_day}  wash_interval=${wash_interval}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_price_last_30_day=False  is_wash_interval=False  enable=False  
   run every case by params  Post Admin Coupon Point Autos Success 200  ${essential_params}  ${unessential_params}

Post Admin Coupon Point Autos Fail With Wrong Params
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  record_num_last_30_day=${record_num_last_30_day_422}  average_price_last_30_day=${average_price_last_30_day_422}  wash_interval=${wash_interval_422}  user_type=${user_type_422}  
   ${unessential_params}  create list  is_record_num_last_30_day=ThisIsRobot!  is_average_price_last_30_day=ThisIsRobot!  is_wash_interval=ThisIsRobot!  enable=ThisIsRobot!  
   run every case by params  Post Admin Coupon Point Autos Fail 422  ${essential_params}  ${unessential_params}

Post Admin Coupon Point Records Fail With Wrong Params
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  user_ids=${user_ids_422}  coupon_pool_id=${coupon_pool_id_422}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Point Records Fail 422  ${essential_params}  ${unessential_params}

Post Admin Coupon Point Records Success 
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Point Records Success 200  ${essential_params}  ${unessential_params}

Post coupon Point Records upload Success 
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Point Records upload Success 200  ${essential_params}  ${unessential_params}

Post coupon Point Records upload Fail With Wrong Params
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Point Records upload Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Autos Success 
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointAuto 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Point Autos Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Autos Fail With Wrong Params
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Coupon Point Autos Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Records Success 
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPointRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Point Records Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Records Fail With Wrong Params
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name_422}  point_remark=${point_remark_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Coupon Point Records Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Points Success 
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPoint 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Points Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Points Fail With Wrong Params
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id_422}  
   ${unessential_params}  create list  user_id=${user_id_422}  mobile=${mobile_422}  status=${status_422}  is_used=${is_used_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Coupon Points Fail 422  ${essential_params}  ${unessential_params}

Patch Admin Coupon Point Records By Coupon Point Record Id Success 
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch Admin Coupon Point Records By Coupon Point Record Id Success 204  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}

Patch Admin Coupon Point Records By Coupon Point Record Id Fail With Wrong Url
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch Admin Coupon Point Records By Coupon Point Record Id Fail 404  ${essential_params}  ${unessential_params}  coupon_point_record_id=${wrong_url_id}

Patch Admin Coupon Point Records By Coupon Point Record Id Fail With Wrong Params
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark_422}  
   run every case by params  Patch Admin Coupon Point Records By Coupon Point Record Id Fail 422  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}

Delete Admin Coupon Point Records By Coupon Point Record Id Fail With Wrong Url
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Coupon Point Records By Coupon Point Record Id Fail 404  coupon_point_record_id=${wrong_url_id}

Delete Admin Coupon Point Records By Coupon Point Record Id Success 
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Coupon Point Records By Coupon Point Record Id Success 204  coupon_point_record_id=${coupon_point_record_id}


*** Variables ***
${coupon_point_record_id}  


*** Keywords ***
Post Admin Coupon Point Autos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Autos   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_Admin_Coupon_Point_Autos_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post Admin Coupon Point Autos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Autos   &{kwargs}
   expect status is 422  ${resp}  

Post Admin Coupon Point Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Records   &{kwargs}
   expect status is 422  ${resp}  

Post Admin Coupon Point Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_Admin_Coupon_Point_Records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post coupon Point Records upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Point Records upload   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Post_coupon_Point_Records_upload_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Post coupon Point Records upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Point Records upload   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Point Autos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Autos   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_Coupon_Point_Autos_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin Coupon Point Autos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Autos   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Point Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_Coupon_Point_Records_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin Coupon Point Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Points Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Points   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_point/Get_Admin_Coupon_Points_200.json
   ${coupon_point_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_point_record_id]}
   set global variable   ${coupon_point_record_id}

Get Admin Coupon Points Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Points   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin Coupon Point Records By Coupon Point Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Admin Coupon Point Records By Coupon Point Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Admin Coupon Point Records By Coupon Point Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Coupon Point Records By Coupon Point Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Coupon Point Records By Coupon Point Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 204  ${resp}  

