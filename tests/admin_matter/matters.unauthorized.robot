*** Settings ***
Documentation  admin_matter
Resource  ../resources.robot
Library  robot_car_wash_server_library.matter.MatterLibrary
Force Tags  model:admin_matter  虾洗后台


*** Test Cases ***
post admin matters Fail Without Login
   [Documentation]  接口名:新增事项${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin matters fail 403   username=${username}  matter_type=${matter_type}  start_time=${start_time}  end_time=${end_time}  duration=${duration}    reason=${reason}  

get admin matters Fail Without Login
   [Documentation]  接口名:获取事项${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin matters fail 403   username=${username}    matter_type=${matter_type}  section=${section}  page_num=${page_num}  page_size=${page_size}  

get admin matters by matter id Fail Without Login
   [Documentation]  接口名:获取事项详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin matters by matter id fail 403     matter_id=${matter_id}

put admin matters by matter id Fail Without Login
   [Documentation]  接口名:编辑事项${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin matters by matter id fail 403     matter_id=${matter_id}  username=${username}  matter_type=${matter_type}  start_time=${start_time}  end_time=${end_time}  duration=${duration}    reason=${reason}  


*** Variables ***
${matter_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin matters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin matters  &{kwargs}
   expect status is 403  ${resp}  

get admin matters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters  &{kwargs}
   expect status is 403  ${resp}  

get admin matters by matter id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters by matter id  &{kwargs}
   expect status is 403  ${resp}  

put admin matters by matter id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin matters by matter id  &{kwargs}
   expect status is 403  ${resp}  

