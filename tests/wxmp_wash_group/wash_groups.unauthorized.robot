*** Settings ***
Documentation  wxmp_wash_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_group.WashGroupLibrary
Force Tags  model:wxmp_wash_group  车主微信端


*** Test Cases ***
post user wash groups Fail Without Login
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  post user wash groups Fail 403  ${essential_params}  ${unessential_params}

get user wash able groups Fail Without Login
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  get user wash able groups Fail 403  ${essential_params}  ${unessential_params}

get wash groups Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  get wash groups Fail 403  ${essential_params}  ${unessential_params}

get wash groups by wash group id Fail Without Login
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get wash groups by wash group id Fail 403    wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id}  12345678909876543


*** Keywords ***
post user wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user wash groups  &{kwargs}
   expect status is 403  ${resp}  

get user wash able groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash able groups  &{kwargs}
   expect status is 403  ${resp}  

get wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups  &{kwargs}
   expect status is 403  ${resp}  

get wash groups by wash group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups by wash group id  &{kwargs}
   expect status is 403  ${resp}  

