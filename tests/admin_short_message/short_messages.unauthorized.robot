*** Settings ***
Documentation  admin_short_message
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message.ShortMessageLibrary
Force Tags  model:admin_short_message  虾洗后台


*** Test Cases ***
post admin short messages Fail Without Login
   [Documentation]  接口名:添加短信通知${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin short messages fail 403   smt_id=${smt_id}  name=${name}  content=${content}    user_id=${user_id}  test_mobile=${test_mobile}  remark=${remark}  

get admin short messages Fail Without Login
   [Documentation]  接口名:查询短信通知${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin short messages fail 403     name=${name}  type=${type}  remark=${remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

get admin short messages by sm id Fail Without Login
   [Documentation]  接口名:查询短信通知记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin short messages by sm id fail 403     sm_id=${sm_id}    user_id=${user_id}  status=${status}  page_num=${page_num}  page_size=${page_size}  

patch admin short messages by sm id Fail Without Login
   [Documentation]  接口名:备注短信通知${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin short messages by sm id fail 403     sm_id=${sm_id}  remark=${remark}    

delete admin short messages by sm id Fail Without Login
   [Documentation]  接口名:删除短信通知${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin short messages by sm id fail 403     sm_id=${sm_id}


*** Variables ***
${sm_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin short messages Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin short messages  &{kwargs}
   expect status is 403  ${resp}  

get admin short messages Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages  &{kwargs}
   expect status is 403  ${resp}  

get admin short messages by sm id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages by sm id  &{kwargs}
   expect status is 403  ${resp}  

patch admin short messages by sm id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short messages by sm id  &{kwargs}
   expect status is 403  ${resp}  

delete admin short messages by sm id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short messages by sm id  &{kwargs}
   expect status is 403  ${resp}  

