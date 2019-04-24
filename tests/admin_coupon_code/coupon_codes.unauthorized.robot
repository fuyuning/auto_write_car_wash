*** Settings ***
Documentation  admin_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_code.CouponCodeLibrary
Force Tags  model:admin_coupon_code  虾洗后台


*** Test Cases ***
Post Admin Coupon Code Records Fail Without Login
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  created_number=${created_number}  
   ${unessential_params}  create list  is_new_user=False  
   run every case by params  Post Admin Coupon Code Records Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Code Records Fail Without Login
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name}  coupon_code_remark=${coupon_code_remark}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Code Records Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Codes Fail Without Login
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id}  coupon_code_no=${coupon_code_no}  user_id=${user_id}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Codes Fail 403  ${essential_params}  ${unessential_params}

Get coupon Codes export by coupon code record id Fail Without Login
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get coupon Codes export by coupon code record id Fail 403  coupon_code_record_id=${coupon_code_record_id}

Patch Remark By Coupon Code Record Id Fail Without Login
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Remark By Coupon Code Record Id Fail 403  ${essential_params}  ${unessential_params}  coupon_code_record_id/remark=${coupon_code_record_id/remark}

Delete Admin Coupon Code Records By Coupon Code Record Id Fail Without Login
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Coupon Code Records By Coupon Code Record Id Fail 403  coupon_code_record_id=${coupon_code_record_id}


*** Variables ***
${coupon_code_record_id}
${coupon_code_record_id/remark}


*** Keywords ***
Post Admin Coupon Code Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Code Records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Code Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Code Records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Codes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Codes   &{kwargs}
   expect status is 403  ${resp}  

Get coupon Codes export by coupon code record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Codes export by coupon code record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Remark By Coupon Code Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Remark By Coupon Code Record Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Coupon Code Records By Coupon Code Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Code Records By Coupon Code Record Id   &{kwargs}
   expect status is 403  ${resp}  

