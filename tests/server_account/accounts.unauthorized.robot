*** Settings ***
Documentation  server_account
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.account.AccountLibrary
Force Tags  model:server_account  中杆后台

*** Test Cases ***
post users Fail Without Login
   [Documentation]  接口名:添加用户${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  username=${username}  password=${username}  realname=${realname}  gender=${gender}  mobile=${mobile}  email=${email}
   ${unessential_params}  create dictionary
   run every case by params   post users fail 403   ${essential_params}  ${unessential_params}

get user Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user fail 403

get users Fail Without Login
   [Documentation]  接口名:获取用户列表信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  username=${username}  page_size=${page_size}  page_num=${page_num}
   run every case by params   get users fail 403   ${essential_params}  ${unessential_params}

get roles Fail Without Login
   [Documentation]  接口名:获取角色列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get roles fail 403

get users by username Fail Without Login
   [Documentation]  接口名:获取指定用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get users by username fail 403     username=${username}

put users password by username Fail Without Login
   [Documentation]  接口名:修改个人密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  old_password=${username}  new_password=${username}
   ${unessential_params}  create dictionary
   run every case by params   put users password by username fail 403   ${essential_params}  ${unessential_params}    username=${username}

put users by username Fail Without Login
   [Documentation]  接口名:修改用户${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  password=${username}  realname=${realname}  gender=${gender}  mobile=${mobile}  email=${email}
   ${unessential_params}  create dictionary
   run every case by params   put users by username fail 403   ${essential_params}  ${unessential_params}    username=${username}

put users roles by username Fail Without Login
   [Documentation]  接口名:分配角色${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  role_ids=${role_ids}
   ${unessential_params}  create dictionary
   run every case by params   put users roles by username fail 403   ${essential_params}  ${unessential_params}    username=${username}

delete users by username Fail Without Login
   [Documentation]  接口名:删除用户${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete users by username fail 403     username=${username}


*** Variables ***
${username}  123456

*** Keywords ***
post users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post users  &{kwargs}
   expect status is 403  ${resp}

get user Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user  &{kwargs}
   expect status is 403  ${resp}

get users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get users  &{kwargs}
   expect status is 403  ${resp}

get roles Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get roles  &{kwargs}
   expect status is 403  ${resp}

get users by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get users by username  &{kwargs}
   expect status is 403  ${resp}

put users password by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put users password by username  &{kwargs}
   expect status is 403  ${resp}

put users by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put users by username  &{kwargs}
   expect status is 403  ${resp}

put users roles by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put users roles by username  &{kwargs}
   expect status is 403  ${resp}

delete users by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete users by username  &{kwargs}
   expect status is 403  ${resp}

