*** Settings ***
Documentation  admin_coupon_code
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_code.CouponCodeLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_code  虾洗后台


*** Test Cases ***
post admin coupon code records Success 
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  created_number=${created_number}  
   ${unessential_params}  create list  is_new_user=False  
   run every case by params  post admin coupon code records Success 201  ${essential_params}  ${unessential_params}

post admin coupon code records Fail With Wrong Params
   [Documentation]  接口名:添加优惠码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id_422}  created_number=${created_number_422}  
   ${unessential_params}  create list  is_new_user=ThisIsRobot!  
   run every case by params  post admin coupon code records Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon code records Success 
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponCodeRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name}  coupon_code_remark=${coupon_code_remark}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon code records Success 200  ${essential_params}  ${unessential_params}

get admin coupon code records Fail With Wrong Params
   [Documentation]  接口名:优惠码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_name=${coupon_code_name_422}  coupon_code_remark=${coupon_code_remark_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin coupon code records Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon codes Success 
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponCode 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id}  coupon_code_no=${coupon_code_no}  user_id=${user_id}  mobile=${mobile}  status=${status}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin coupon codes Success 200  ${essential_params}  ${unessential_params}

get admin coupon codes Fail With Wrong Params
   [Documentation]  接口名:码库${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  coupon_code_record_id=${coupon_code_record_id_422}  coupon_code_no=${coupon_code_no_422}  user_id=${user_id_422}  mobile=${mobile_422}  status=${status_422}  car_id=${car_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin coupon codes Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin coupon codes export by coupon code record id Fail With Wrong Url
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin coupon codes export by coupon code record id Fail 404    coupon_code_record_id=${wrong_url_id}

get admin coupon codes export by coupon code record id Success 
   [Documentation]  接口名:导出优惠码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   get admin coupon codes export by coupon code record id Success 200    coupon_code_record_id=${coupon_code_record_id}

patch admin coupon code records remark by coupon code record id Fail With Wrong Url
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  patch admin coupon code records remark by coupon code record id Fail 404  ${essential_params}  ${unessential_params}    coupon_code_record_id=${wrong_url_id}

patch admin coupon code records remark by coupon code record id Success 
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark}  
   ${unessential_params}  create list  
   run every case by params  patch admin coupon code records remark by coupon code record id Success 204  ${essential_params}  ${unessential_params}    coupon_code_record_id=${coupon_code_record_id}

patch admin coupon code records remark by coupon code record id Fail With Wrong Params
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_code_remark=${coupon_code_remark_422}  
   ${unessential_params}  create list  
   run every case by params  patch admin coupon code records remark by coupon code record id Fail 422  ${essential_params}  ${unessential_params}    coupon_code_record_id=${coupon_code_record_id}  success=False

delete admin coupon code records by coupon code record id Fail With Wrong Url
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin coupon code records by coupon code record id Fail 404    coupon_code_record_id=${wrong_url_id}

delete admin coupon code records by coupon code record id Success 
   [Documentation]  接口名:删除优惠码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin coupon code records by coupon code record id Success 204    coupon_code_record_id=${coupon_code_record_id}


*** Variables ***
${coupon_code_record_id}  


*** Keywords ***
post admin coupon code records Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon code records  &{kwargs}
   expect status is 201  ${resp}  admin_coupon_code/post_admin_coupon_code_records_201.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}

post admin coupon code records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon code records  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon code records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon code records  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/get_admin_coupon_code_records_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}

get admin coupon code records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon code records  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon codes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/get_admin_coupon_codes_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}

get admin coupon codes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon codes export by coupon code record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes export by coupon code record id  &{kwargs}
   expect status is 404  ${resp}  

get admin coupon codes export by coupon code record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon codes export by coupon code record id  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_code/get_admin_coupon_codes_export_by_coupon_code_record_id_200.json
   ${coupon_code_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_code_record_id]}
   set global variable   ${coupon_code_record_id}

patch admin coupon code records remark by coupon code record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon code records remark by coupon code record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin coupon code records remark by coupon code record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon code records remark by coupon code record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin coupon code records remark by coupon code record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon code records remark by coupon code record id  &{kwargs}
   expect status is 422  ${resp}  

delete admin coupon code records by coupon code record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon code records by coupon code record id  &{kwargs}
   expect status is 404  ${resp}  

delete admin coupon code records by coupon code record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon code records by coupon code record id  &{kwargs}
   expect status is 204  ${resp}  

