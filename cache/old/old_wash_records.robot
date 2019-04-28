*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
get user after sales Success 
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  after_sale=${after_sale}  section=${section}  page_limit=${page_limit}  
   run every case by params  get user after sales Success 200  ${essential_params}  ${unessential_params}

get user after sales Fail With Wrong Params
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  order_status=${order_status_422}  after_sale=${after_sale_422}  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  get user after sales Fail 422  ${essential_params}  ${unessential_params}  success=False

get user wash record by order Success 
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  get user wash record by order Success 200  ${essential_params}  ${unessential_params}

get user wash record by order Fail With Wrong Params
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_id=${order_id_422}  
   ${unessential_params}  create list  refresh=ThisIsRobot!  
   run every case by params  get user wash record by order Fail 422  ${essential_params}  ${unessential_params}  success=False

get user wash records Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  get user wash records Success 200  ${essential_params}  ${unessential_params}

get user wash records Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  order_status=${order_status_422}  section=${section_422}  page_limit=${page_limit_422}  comment_status=${comment_status_422}  
   run every case by params  get user wash records Fail 422  ${essential_params}  ${unessential_params}  success=False

get wash records Success 
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get wash records Success 200  ${essential_params}  ${unessential_params}

get wash records Fail With Wrong Params
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_group_id=${wash_group_id_422}  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  get wash records Fail 422  ${essential_params}  ${unessential_params}  success=False

get user wash records by wash record id Fail With Wrong Url
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  get user wash records by wash record id Fail 404  ${essential_params}  ${unessential_params}    wash_record_id=${wrong_url_id}

get user wash records by wash record id Success 
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  get user wash records by wash record id Success 200  ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

get user wash records by wash record id Fail With Wrong Params
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  
   ${unessential_params}  create list  
   run every case by params  get user wash records by wash record id Fail 422  ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False


*** Variables ***
${wash_record_id}  


*** Keywords ***
get user after sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_after_sales_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get user after sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 422  ${resp}  

get user wash record by order Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_record_by_order_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get user wash record by order Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 422  ${resp}  

get user wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get user wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 422  ${resp}  

get wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 422  ${resp}  

get user wash records by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 404  ${resp}  

get user wash records by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_records_by_wash_record_id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get user wash records by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 422  ${resp}  

