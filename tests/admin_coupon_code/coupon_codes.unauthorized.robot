*** Settings ***
Documentation  admin_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_code.CouponCodeLibrary
Force Tags  model:admin_coupon_code  虾洗后台


*** Test Cases ***
post admin coupon code records Fail Without Login
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  created_number=${created_number}  
   ${unessential_params}  create list  is_new_user=False  
   run every case by params  post admin coupon code records Fail 403  ${essential_params}  ${unessential_params}

get admin coupon code records Fail Without Login
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name}  coupon_code_remark=${coupon_code_remark}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon code records Fail 403  ${essential_params}  ${unessential_params}

get admin coupon codes Fail Without Login
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id}  coupon_code_no=${coupon_code_no}  user_id=${user_id}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon codes Fail 403  ${essential_params}  ${unessential_params}

get admin coupon codes export by coupon code record id Fail Without Login
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin coupon codes export by coupon code record id Fail 403    coupon_code_record_id=${coupon_code_record_id}

patch admin coupon code records remark by coupon code record id Fail Without Login
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  patch admin coupon code records remark by coupon code record id Fail 403  ${essential_params}  ${unessential_params}    coupon_code_record_id=${coupon_code_record_id}

delete admin coupon code records by coupon code record id Fail Without Login
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon code records by coupon code record id Fail 403    coupon_code_record_id=${coupon_code_record_id}


*** Variables ***
${coupon_code_record_id}  12345678909876543


*** Keywords ***
post admin coupon code records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon code records  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon code records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon code records  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon codes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon codes export by coupon code record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes export by coupon code record id  &{kwargs}
   expect status is 403  ${resp}  

patch admin coupon code records remark by coupon code record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon code records remark by coupon code record id  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon code records by coupon code record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon code records by coupon code record id  &{kwargs}
   expect status is 403  ${resp}  

