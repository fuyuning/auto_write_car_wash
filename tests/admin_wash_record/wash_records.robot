*** Settings ***
Documentation  admin_wash_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_record  虾洗后台


*** Test Cases ***
post admin wash records refund by wash record id Success 
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  refunds=${refunds}  
   ${unessential_params}  create dictionary  refund_description=${refund_description}  
   run every case by params   post admin wash records refund by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post admin wash records refund by wash record id Fail With Wrong Url
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post admin wash records refund by wash record id fail 404     wash_record_id=${wrong_url_id}  refunds=${refunds}    refund_description=${refund_description}  

post admin wash records refund by wash record id Fail With Wrong Params
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  refunds=${refunds_422}  
   ${unessential_params}  create dictionary  refund_description=${refund_description_422}  
   run every case by params   post admin wash records refund by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

post admin wash records close by wash record id Success 
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  close_description=${close_description}  
   run every case by params   post admin wash records close by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post admin wash records close by wash record id Fail With Wrong Url
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post admin wash records close by wash record id fail 404     wash_record_id=${wrong_url_id}    close_description=${close_description}  

post admin wash records close by wash record id Fail With Wrong Params
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  close_description=${close_description_422}  
   run every case by params   post admin wash records close by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

get admin wash records Success 
   [Documentation]  接口名:洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create dictionary  order_no=${order_no}  status=${status}  car_id=${car_id}  mobile=${mobile}  wash_area_id=${wash_area_id}  submit_section=${submit_section}  user_id=${user_id}  wash_seconds=${wash_seconds}  order_type=${order_type}  is_deleted=False  
   run every case by params   get admin wash records success 200   ${essential_params}  ${unessential_params}

get admin wash records Fail With Wrong Params
   [Documentation]  接口名:洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create dictionary  order_no=${order_no_422}  status=${status_422}  car_id=${car_id_422}  mobile=${mobile_422}  wash_area_id=${wash_area_id_422}  submit_section=${submit_section_422}  user_id=${user_id_422}  wash_seconds=${wash_seconds_422}  order_type=${order_type_422}  is_deleted=ThisIsRobot!  
   run every case by params   get admin wash records fail 422   ${essential_params}  ${unessential_params}  success=False

get admin wash records by wash record id Success 
   [Documentation]  接口名:洗车记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   get admin wash records by wash record id success 200     wash_record_id=${wash_record_id}

get admin wash records by wash record id Fail With Wrong Url
   [Documentation]  接口名:洗车记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wash records by wash record id fail 404     wash_record_id=${wrong_url_id}

patch admin wash records is deleted by wash record id Success 
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  is_deleted=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash records is deleted by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch admin wash records is deleted by wash record id Fail With Wrong Url
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash records is deleted by wash record id fail 404     wash_record_id=${wrong_url_id}  is_deleted=False    

patch admin wash records is deleted by wash record id Fail With Wrong Params
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  is_deleted=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash records is deleted by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch admin wash record by wash record id Success 
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  admin_remark=${admin_remark}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash record by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch admin wash record by wash record id Fail With Wrong Url
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash record by wash record id fail 404     wash_record_id=${wrong_url_id}  admin_remark=${admin_remark}    

patch admin wash record by wash record id Fail With Wrong Params
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  admin_remark=${admin_remark_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash record by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch admin wash records (car id|mobile|name) by wash record id Fail With Wrong Params
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  mobile=${mobile_422}  name=${name_422}  
   run every case by params   patch admin wash records (car id|mobile|name) by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch admin wash records (car id|mobile|name) by wash record id Success 
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params   patch admin wash records (car id|mobile|name) by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch admin wash records (car id|mobile|name) by wash record id Fail With Wrong Url
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash records (car id|mobile|name) by wash record id fail 404     wash_record_id=${wrong_url_id}    car_id=${car_id}  mobile=${mobile}  name=${name}  

patch admin wash records serve time by wash record id Fail With Wrong Params
   [Documentation]  接口名:订单修改预约服务时间${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  serve_time=${serve_time_422}  expect_time=${expect_time_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash records serve time by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch admin wash records serve time by wash record id Success 
   [Documentation]  接口名:订单修改预约服务时间${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  serve_time=${serve_time}  expect_time=${expect_time}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash records serve time by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch admin wash records serve time by wash record id Fail With Wrong Url
   [Documentation]  接口名:订单修改预约服务时间${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash records serve time by wash record id fail 404     wash_record_id=${wrong_url_id}  serve_time=${serve_time}  expect_time=${expect_time}    

delete admin wash records by wash record id Fail With Wrong Url
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wash records by wash record id fail 404     wash_record_id=${wrong_url_id}

delete admin wash records by wash record id Success 
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wash records by wash record id success 204     wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id}  


*** Keywords ***
post admin wash records refund by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records refund by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post admin wash records refund by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records refund by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post admin wash records refund by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records refund by wash record id  &{kwargs}
   expect status is 422  ${resp}  

post admin wash records close by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records close by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post admin wash records close by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records close by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post admin wash records close by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records close by wash record id  &{kwargs}
   expect status is 422  ${resp}  

get admin wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash records  &{kwargs}
   expect status is 200  ${resp}  admin_wash_record/get_admin_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get admin wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash records  &{kwargs}
   expect status is 422  ${resp}  

get admin wash records by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash records by wash record id  &{kwargs}
   expect status is 200  ${resp}  admin_wash_record/get_admin_wash_records_by_wash_record_id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get admin wash records by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash records by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash records is deleted by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records is deleted by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash records is deleted by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records is deleted by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash records is deleted by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records is deleted by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash record by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash record by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash record by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash records (car id|mobile|name) by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash records (car id|mobile|name) by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash records (car id|mobile|name) by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash records serve time by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records serve time by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash records serve time by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records serve time by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash records serve time by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records serve time by wash record id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wash records by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wash records by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 204  ${resp}  

