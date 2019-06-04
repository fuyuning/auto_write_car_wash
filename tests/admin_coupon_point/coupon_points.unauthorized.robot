*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
post admin coupon point autos Fail Without Login
   [Documentation]  接口名:添加自动定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin coupon point autos fail 403   coupon_pool_id=${coupon_pool_id}  record_num_last_30_day=${record_num_last_30_day}  average_price_last_30_day=${average_price_last_30_day}  wash_interval=${wash_interval}  user_type=${user_type}    is_record_num_last_30_day=False  is_average_price_last_30_day=False  is_wash_interval=False  enable=False  is_short_message_template=False  

post admin coupon point records Fail Without Login
   [Documentation]  接口名:批量添加定向券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin coupon point records fail 403   user_ids=${user_ids}  coupon_pool_id=${coupon_pool_id}    is_short_message_template=False  

post admin coupon point records upload Fail Without Login
   [Documentation]  接口名:文件上传(已停用)${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin coupon point records upload fail 403   coupon_pool_id=${coupon_pool_id}    

get admin coupon point autos Fail Without Login
   [Documentation]  接口名:自动定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon point autos fail 403     coupon_name=${coupon_name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

get admin coupon point records Fail Without Login
   [Documentation]  接口名:定向发券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon point records fail 403     coupon_name=${coupon_name}  point_remark=${point_remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

get admin coupon points Fail Without Login
   [Documentation]  接口名:发放记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon points fail 403     coupon_point_record_id=${coupon_point_record_id}  coupon_point_auto_id=${coupon_point_auto_id}  auto_coupon_point=False  user_id=${user_id}  mobile=${mobile}  status=${status}  is_used=${is_used}  page_num=${page_num}  page_size=${page_size}  

patch admin coupon point autos enabled by coupon point auto id Fail Without Login
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin coupon point autos enabled by coupon point auto id fail 403     coupon_point_auto_id=${coupon_point_auto_id}    enabled=False  

patch admin coupon point records by coupon point record id Fail Without Login
   [Documentation]  接口名:定向发券备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin coupon point records by coupon point record id fail 403     coupon_point_record_id=${coupon_point_record_id}    point_remark=${point_remark}  

delete admin coupon point autos by coupon point auto id Fail Without Login
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon point autos by coupon point auto id fail 403     coupon_point_auto_id=${coupon_point_auto_id}

delete admin coupon point records by coupon point record id Fail Without Login
   [Documentation]  接口名:删除定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon point records by coupon point record id fail 403     coupon_point_record_id=${coupon_point_record_id}


*** Variables ***
${coupon_point_auto_id}  1a2b3c4d5e6f7zz
${coupon_point_record_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin coupon point autos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point autos  &{kwargs}
   expect status is 403  ${resp}  

post admin coupon point records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records  &{kwargs}
   expect status is 403  ${resp}  

post admin coupon point records upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon point records upload  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon point autos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point autos  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon point records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon point records  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon points Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon points  &{kwargs}
   expect status is 403  ${resp}  

patch admin coupon point autos enabled by coupon point auto id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enabled by coupon point auto id  &{kwargs}
   expect status is 403  ${resp}  

patch admin coupon point records by coupon point record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point records by coupon point record id  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon point autos by coupon point auto id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon point records by coupon point record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point records by coupon point record id  &{kwargs}
   expect status is 403  ${resp}  

