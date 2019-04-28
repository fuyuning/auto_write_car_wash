*** Settings ***
Documentation  admin_turntable
Resource  ../resources.robot
Library  robot_car_wash_server_library.turntable.TurntableLibrary
Force Tags  model:admin_turntable  虾洗后台


*** Test Cases ***
post admin turntables Fail Without Login
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  post admin turntables Fail 403  ${essential_params}  ${unessential_params}

get admin turntables Fail Without Login
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  get admin turntables Fail 403  ${essential_params}  ${unessential_params}

get admin turntables by turntable id Fail Without Login
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin turntables by turntable id Fail 403    turntable_id=${turntable_id}

get admin turntable awards Fail Without Login
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin turntable awards Fail 403  ${essential_params}  ${unessential_params}

put admin turntables by turntable id Fail Without Login
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  put admin turntables by turntable id Fail 403  ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}

patch admin turntables enabled by turntable id Fail Without Login
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  patch admin turntables enabled by turntable id Fail 403  ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}

delete admin turntables by turntable id Fail Without Login
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin turntables by turntable id Fail 403    turntable_id=${turntable_id}


*** Variables ***
${turntable_id}  12345678909876543


*** Keywords ***
post admin turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables  &{kwargs}
   expect status is 403  ${resp}  

get admin turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables  &{kwargs}
   expect status is 403  ${resp}  

get admin turntables by turntable id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

get admin turntable awards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards  &{kwargs}
   expect status is 403  ${resp}  

put admin turntables by turntable id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

patch admin turntables enabled by turntable id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin turntables enabled by turntable id  &{kwargs}
   expect status is 403  ${resp}  

delete admin turntables by turntable id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

