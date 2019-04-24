*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
Post Admin Coupon Point Autos Fail Without Login
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_price_last_30_day=${average_price_last_30_day}  wash_interval=${wash_interval}  user_type=${user_type}  
   ${unessential_params}  create list  is_record_num_last_30_day=False  is_average_price_last_30_day=False  is_wash_interval=False  enable=False  
   run every case by params  Post Admin Coupon Point Autos Fail 403  ${essential_params}  ${unessential_params}

Post Admin Coupon Point Records Fail Without Login
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Point Records Fail 403  ${essential_params}  ${unessential_params}

Post coupon Point Records upload Fail Without Login
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Point Records upload Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Autos Fail Without Login
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Point Autos Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Point Records Fail Without Login
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Point Records Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Points Fail Without Login
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_point_record_id=${coupon_point_record_id}  
   ${unessential_params}  create list  coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Points Fail 403  ${essential_params}  ${unessential_params}

Patch Admin Coupon Point Records By Coupon Point Record Id Fail Without Login
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  point_remark=${point_remark}  
   run every case by params  Patch Admin Coupon Point Records By Coupon Point Record Id Fail 403  ${essential_params}  ${unessential_params}  coupon_point_record_id=${coupon_point_record_id}

Delete Admin Coupon Point Records By Coupon Point Record Id Fail Without Login
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Coupon Point Records By Coupon Point Record Id Fail 403  coupon_point_record_id=${coupon_point_record_id}


*** Variables ***
${coupon_point_record_id}


*** Keywords ***
Post Admin Coupon Point Autos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Autos   &{kwargs}
   expect status is 403  ${resp}  

Post Admin Coupon Point Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Point Records   &{kwargs}
   expect status is 403  ${resp}  

Post coupon Point Records upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Point Records upload   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Point Autos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Autos   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Point Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Point Records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Points Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Points   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Coupon Point Records By Coupon Point Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Coupon Point Records By Coupon Point Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Point Records By Coupon Point Record Id   &{kwargs}
   expect status is 403  ${resp}  

