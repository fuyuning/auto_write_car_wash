*** Settings ***
Documentation  admin_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_code.CouponCodeLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_code  虾洗后台


*** Test Cases ***
Post Admin Coupon Code Records Success 
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  created_number=${created_number}  
   ${unessential_params}  create list  is_new_user=False  
   run every case by params  Post Admin Coupon Code Records Success 201  ${essential_params}  ${unessential_params}

Post Admin Coupon Code Records Fail With Wrong Params
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  created_number=${created_number}  
   ${unessential_params}  create list  is_new_user=False  
   run every case by params  Post Admin Coupon Code Records Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Code Records Success 
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponCodeRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name}  coupon_code_remark=${coupon_code_remark}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Code Records Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Code Records Fail With Wrong Params
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name}  coupon_code_remark=${coupon_code_remark}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Code Records Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Codes Success 
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponCode 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id}  coupon_code_no=${coupon_code_no}  user_id=${user_id}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Codes Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Codes Fail With Wrong Params
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id}  coupon_code_no=${coupon_code_no}  user_id=${user_id}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Coupon Codes Fail 422  ${essential_params}  ${unessential_params}

Get coupon Codes export by coupon code record id Fail With Wrong Url
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get coupon Codes export by coupon code record id Fail 404  coupon_code_record_id=${wrong_url_id}

Get coupon Codes export by coupon code record id Success 
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   Get coupon Codes export by coupon code record id Success 200  coupon_code_record_id=${coupon_code_record_id}

Patch Remark By Coupon Code Record Id Success 
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Remark By Coupon Code Record Id Success 204  ${essential_params}  ${unessential_params}  coupon_code_record_id/remark=${coupon_code_record_id/remark}

Patch Remark By Coupon Code Record Id Fail With Wrong Url
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Remark By Coupon Code Record Id Fail 404  ${essential_params}  ${unessential_params}  coupon_code_record_id/remark=${wrong_url_id}

Patch Remark By Coupon Code Record Id Fail With Wrong Params
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Remark By Coupon Code Record Id Fail 422  ${essential_params}  ${unessential_params}  coupon_code_record_id/remark=${coupon_code_record_id/remark}

Delete Admin Coupon Code Records By Coupon Code Record Id Success 
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Coupon Code Records By Coupon Code Record Id Success 204  coupon_code_record_id=${coupon_code_record_id}

Delete Admin Coupon Code Records By Coupon Code Record Id Fail With Wrong Url
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Coupon Code Records By Coupon Code Record Id Fail 404  coupon_code_record_id=${wrong_url_id}


*** Variables ***
${coupon_code_record_id}
${coupon_code_record_id/remark}


*** Keywords ***
Post Admin Coupon Code Records Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Code Records   &{kwargs}
   expect status is 201  ${resp}  admin_coupon_code/Post_Admin_Coupon_Code_Records_201.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}
   ${coupon_code_record_id/remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id/remark]}
   set global variable   ${coupon_code_record_id/remark}

Post Admin Coupon Code Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Code Records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Code Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Code Records   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/Get_Admin_Coupon_Code_Records_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}
   ${coupon_code_record_id/remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id/remark]}
   set global variable   ${coupon_code_record_id/remark}

Get Admin Coupon Code Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Code Records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Codes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Codes   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/Get_Admin_Coupon_Codes_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}
   ${coupon_code_record_id/remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id/remark]}
   set global variable   ${coupon_code_record_id/remark}

Get Admin Coupon Codes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Codes   &{kwargs}
   expect status is 422  ${resp}  

Get coupon Codes export by coupon code record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Codes export by coupon code record id   &{kwargs}
   expect status is 404  ${resp}  

Get coupon Codes export by coupon code record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Codes export by coupon code record id   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/Get_coupon_Codes_export_by_coupon_code_record_id_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}
   ${coupon_code_record_id/remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id/remark]}
   set global variable   ${coupon_code_record_id/remark}

Patch Remark By Coupon Code Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Remark By Coupon Code Record Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Remark By Coupon Code Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Remark By Coupon Code Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Remark By Coupon Code Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Remark By Coupon Code Record Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Coupon Code Records By Coupon Code Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Code Records By Coupon Code Record Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Coupon Code Records By Coupon Code Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Code Records By Coupon Code Record Id   &{kwargs}
   expect status is 404  ${resp}  

