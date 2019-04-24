*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
Get User Wash Record By Order Fail Without Login
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get User Wash Record By Order Fail 403  ${essential_params}  ${unessential_params}

Get User Wash Records Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get User Wash Records Fail 403  ${essential_params}  ${unessential_params}

Get Wash Records Fail Without Login
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get Wash Records Fail 403  ${essential_params}  ${unessential_params}

Get User Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get User Wash Records By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id}  12345678909876543


*** Keywords ***
Get User Wash Record By Order Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Record By Order   &{kwargs}
   expect status is 403  ${resp}  

Get User Wash Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 403  ${resp}  

Get Wash Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Records   &{kwargs}
   expect status is 403  ${resp}  

Get User Wash Records By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

