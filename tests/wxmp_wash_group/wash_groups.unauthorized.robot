*** Settings ***
Documentation  wxmp_wash_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_group.WashGroupLibrary
Force Tags  model:wxmp_wash_group  车主微信端


*** Test Cases ***
Post User Wash Groups Fail Without Login
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post User Wash Groups Fail 403  ${essential_params}  ${unessential_params}

Get User Wash Able Groups Fail Without Login
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get User Wash Able Groups Fail 403  ${essential_params}  ${unessential_params}

Get Wash Groups Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get Wash Groups Fail 403  ${essential_params}  ${unessential_params}

Get Wash Groups By Wash Group Id Fail Without Login
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Wash Groups By Wash Group Id Fail 403  wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id}


*** Keywords ***
Post User Wash Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Groups   &{kwargs}
   expect status is 403  ${resp}  

Get User Wash Able Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Able Groups   &{kwargs}
   expect status is 403  ${resp}  

Get Wash Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups   &{kwargs}
   expect status is 403  ${resp}  

Get Wash Groups By Wash Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups By Wash Group Id   &{kwargs}
   expect status is 403  ${resp}  

