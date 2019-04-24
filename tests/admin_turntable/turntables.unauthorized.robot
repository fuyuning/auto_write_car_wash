*** Settings ***
Documentation  admin_turntable
Resource  ../resources.robot
Library  robot_car_wash_server_library.turntable.TurntableLibrary
Force Tags  model:admin_turntable  虾洗后台


*** Test Cases ***
Post Admin Turntables Fail Without Login
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Turntables Fail 403  ${essential_params}  ${unessential_params}

Get Admin Turntables Fail Without Login
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get Admin Turntables Fail 403  ${essential_params}  ${unessential_params}

Get Admin Turntables By Turntable Id Fail Without Login
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Turntables By Turntable Id Fail 403  turntable_id=${turntable_id}

Get Admin Turntable Awards Fail Without Login
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Turntable Awards Fail 403  ${essential_params}  ${unessential_params}

Put Admin Turntables By Turntable Id Fail Without Login
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put Admin Turntables By Turntable Id Fail 403  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}

Patch Enabled By Turntable Id Fail Without Login
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Turntable Id Fail 403  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}

Delete Admin Turntables By Turntable Id Fail Without Login
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Turntables By Turntable Id Fail 403  turntable_id=${turntable_id}


*** Variables ***
${turntable_id}
${turntable_id/enabled}


*** Keywords ***
Post Admin Turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Turntables   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Turntables By Turntable Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables By Turntable Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Turntable Awards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntable Awards   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Turntables By Turntable Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Turntables By Turntable Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Enabled By Turntable Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Turntable Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Turntables By Turntable Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Turntables By Turntable Id   &{kwargs}
   expect status is 403  ${resp}  

