*** Settings ***
Documentation  admin_admin_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_user.AdminUserLibrary
Force Tags  model:admin_admin_user  虾洗后台


*** Test Cases ***
post admin admin users Fail Without Login
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin admin users fail 403   username=${username}  name=${name}  mobile=${mobile}  password=${password}    email=${email}  

post admin login Fail Without Login
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin login fail 403   password=${password}  username=${username}  vk=${vk}    num=${num}  

post admin logout Fail Without Login
   [Documentation]  接口名:帐号注销${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    post admin logout fail 403

get admin admin users Fail Without Login
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin admin users fail 403     username=${username}  name=${name}  mobile=${mobile}  page_num=${page_num}  page_size=${page_size}  

get admin admin users by username Fail Without Login
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin admin users by username fail 403     username=${username}

get admin user Fail Without Login
   [Documentation]  接口名:获取信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin user fail 403

put admin admin users by username Fail Without Login
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin admin users by username fail 403     username=${username}  username=${username}  name=${name}  mobile=${mobile}  password=${password}    email=${email}  

patch admin admin users is active by username Fail Without Login
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin admin users is active by username fail 403     username=${username}  is_active=False    


*** Variables ***
${username}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin admin users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin admin users  &{kwargs}
   expect status is 403  ${resp}  

post admin login Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin login  &{kwargs}
   expect status is 403  ${resp}  

post admin logout Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin logout  &{kwargs}
   expect status is 403  ${resp}  

get admin admin users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users  &{kwargs}
   expect status is 403  ${resp}  

get admin admin users by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users by username  &{kwargs}
   expect status is 403  ${resp}  

get admin user Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin user  &{kwargs}
   expect status is 403  ${resp}  

put admin admin users by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin admin users by username  &{kwargs}
   expect status is 403  ${resp}  

patch admin admin users is active by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin admin users is active by username  &{kwargs}
   expect status is 403  ${resp}  

