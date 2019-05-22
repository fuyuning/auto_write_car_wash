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
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  post admin admin users Fail 403  ${essential_params}  ${unessential_params}

get admin admin users Fail Without Login
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin admin users Fail 403  ${essential_params}  ${unessential_params}

get admin admin users by username Fail Without Login
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin admin users by username Fail 403    username=${username}

put admin admin users by username Fail Without Login
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  put admin admin users by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}

patch admin admin users is active by username Fail Without Login
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  patch admin admin users is active by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}


*** Variables ***
${username}  12345678909876543


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

