*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
get user after sales Fail Without Login
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  after_sale=${after_sale}  section=${section}  page_limit=${page_limit}  
   run every case by params  get user after sales Fail 403  ${essential_params}  ${unessential_params}

get user wash record by order Fail Without Login
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  get user wash record by order Fail 403  ${essential_params}  ${unessential_params}

get user wash records Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  get user wash records Fail 403  ${essential_params}  ${unessential_params}

get wash records Fail Without Login
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get wash records Fail 403  ${essential_params}  ${unessential_params}

get user wash records by wash record id Fail Without Login
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  get user wash records by wash record id Fail 403  ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id}  12345678909876543


*** Keywords ***
get user after sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 403  ${resp}  

get user wash record by order Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 403  ${resp}  

get user wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 403  ${resp}  

get wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 403  ${resp}  

get user wash records by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

