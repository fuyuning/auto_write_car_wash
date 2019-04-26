*** Settings ***
Documentation  admin_admin_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_user.AdminUserLibrary
Force Tags  model:admin_admin_user  虾洗后台


*** Test Cases ***
Post Admin Admin Users Fail Without Login
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  Post Admin Admin Users Fail 403  ${essential_params}  ${unessential_params}

Post Admin Login Fail Without Login
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  password=${password}  username=${username}  vk=${vk}  
   ${unessential_params}  create list  num=${num}  
   run every case by params  Post Admin Login Fail 403  ${essential_params}  ${unessential_params}

Post Admin Logout Fail Without Login
   [Documentation]  接口名:帐号注销${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Post Admin Logout Fail 403

Get Admin Admin Users Fail Without Login
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Admin Users Fail 403  ${essential_params}  ${unessential_params}

Get Admin Admin Users By Username Fail Without Login
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Admin Users By Username Fail 403  username=${username}

Get Admin User Fail Without Login
   [Documentation]  接口名:获取信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin User Fail 403

Put Admin Admin Users By Username Fail Without Login
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  Put Admin Admin Users By Username Fail 403  ${essential_params}  ${unessential_params}  username=${username}

Patch is Active by username Fail Without Login
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Fail 403  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}


*** Variables ***
${username}  12345678909876543
${username/is_active}  12345678909876543


*** Keywords ***
Post Admin Admin Users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Admin Users   &{kwargs}
   expect status is 403  ${resp}  

Post Admin Login Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Login   &{kwargs}
   expect status is 403  ${resp}  

Post Admin Logout Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Logout   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Admin Users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Admin Users By Username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users By Username   &{kwargs}
   expect status is 403  ${resp}  

Get Admin User Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin User   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Admin Users By Username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Admin Users By Username   &{kwargs}
   expect status is 403  ${resp}  

Patch is Active by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 403  ${resp}  

