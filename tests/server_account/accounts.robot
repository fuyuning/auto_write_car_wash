*** Settings ***
Documentation  server_account
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.account.AccountLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_account  中杆后台


*** Test Cases ***
post users Success
   [Documentation]  接口名:添加用户${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${mobile}  make num
   set global variable  ${mobile}
   ${username}  set variable  robot${mobile}
   set global variable  ${username}
   ${essential_params}  create dictionary  username=${username}  password=${username}  realname=${realname}  gender=${gender}  mobile=${mobile}  email=${mobile}@163.com
   ${unessential_params}  create dictionary
   run every case by params   post users success 201   ${essential_params}  ${unessential_params}

post users Fail With Wrong Params
   [Documentation]  接口名:添加用户${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  password=${password_422}  realname=${realname_422}  gender=${gender_422}  mobile=${mobile_422}  email=${email_422}
   ${unessential_params}  create dictionary
   run every case by params   post users fail 422   ${essential_params}  ${unessential_params}  success=False

get user Success
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
    get user success 200

get users Success
   [Documentation]  接口名:获取用户列表信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  username=${username}  page_size=${page_size}  page_num=${page_num}
   run every case by params   get users success 200   ${essential_params}  ${unessential_params}

get users Fail With Wrong Params
   [Documentation]  接口名:获取用户列表信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  page_size=${page_size_422}  page_num=${page_num_422}
   run every case by params   get users fail 422   ${essential_params}  ${unessential_params}  success=False

get users by username Success
   [Documentation]  接口名:获取指定用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 对象。
   [Tags]           Respcode:200
   get users by username success 200     username=${username}

get users by username Fail With Wrong Url
   [Documentation]  接口名:获取指定用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get users by username fail 404     username=${wrong_url_id}

get roles Success
   [Documentation]  接口名:获取角色列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Role 列表。
   [Tags]           Respcode:200
    get roles success 200

put users by username Success
   [Documentation]  接口名:修改用户${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  realname=${realname}  gender=${gender}  mobile=${mobile}  email=${mobile}@163.com
   ${unessential_params}  create dictionary  password=${username}
   run every case by params   put users by username success 204   ${essential_params}  ${unessential_params}    username=${username}

put users by username Fail With Wrong Url
   [Documentation]  接口名:修改用户${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  realname=${realname}  gender=${gender}  mobile=${mobile}  email=${mobile}@163.com
   ${unessential_params}  create dictionary  password=${username}
   run every case by params   put users by username fail 404   ${essential_params}  ${unessential_params}    username=${wrong_url_id}

put users by username Fail With Wrong Params
   [Documentation]  接口名:修改用户${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  realname=${realname_422}  gender=${gender_422}  mobile=${mobile_422}  email=${email_422}
   ${unessential_params}  create dictionary  password=${password_422}
   run every case by params   put users by username fail 422   ${essential_params}  ${unessential_params}    username=${username}  success=False

put users roles by username Success
   [Documentation]  接口名:分配角色${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  role_ids=${role_ids}
   ${unessential_params}  create dictionary
   run every case by params   put users roles by username success 204   ${essential_params}  ${unessential_params}    username=${username}

put users roles by username Fail With Wrong Url
   [Documentation]  接口名:分配角色${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  role_ids=${role_ids}
   ${unessential_params}  create dictionary
   run every case by params   put users roles by username fail 404   ${essential_params}  ${unessential_params}    username=${wrong_url_id}

put users roles by username Fail With Wrong Params
   [Documentation]  接口名:分配角色${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  role_ids=${role_ids_422}
   ${unessential_params}  create dictionary
   run every case by params   put users roles by username fail 422   ${essential_params}  ${unessential_params}    username=${username}  success=False

put users password by username Fail With Wrong Params
   [Documentation]  接口名:修改个人密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  old_password=${old_password_422}  new_password=${new_password_422}
   ${unessential_params}  create dictionary
   run every case by params   put users password by username fail 422   ${essential_params}  ${unessential_params}    username=${username}  success=False

put users password by username Fail With Wrong Url
   [Documentation]  接口名:修改个人密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  old_password=${username}  new_password=${username}
   ${unessential_params}  create dictionary
   run every case by params   put users password by username fail 404   ${essential_params}  ${unessential_params}    username=${wrong_url_id}

delete users by username Success
   [Documentation]  接口名:删除用户${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${res}=   post users  username=waitfordel  password=waitfordel  realname=waitfordel  gender=1  mobile=15566015171  email=15566015171@163.com
   ${username}  set variable  ${res.json()['username']}
   delete users by username success 204     username=${username}

delete users by username Fail With Wrong Url
   [Documentation]  接口名:删除用户${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete users by username fail 404     username=${wrong_url_id}

put users password by username Success
   [Documentation]  接口名:修改个人密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  old_password=${username}  new_password=123${username}
   ${unessential_params}  create dictionary
   run every case by params   put users password by username success 204   ${essential_params}  ${unessential_params}    username=${username}



*** Variables ***
${username}
${mobile}

*** Keywords ***
post users Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post users  &{kwargs}
   expect status is 201  ${resp}  server_account/post_users_201.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()['username']}
   set global variable   ${username}

post users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post users  &{kwargs}
   expect status is 422  ${resp}

get user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user  &{kwargs}
   expect status is 200  ${resp}  server_account/get_user_200.json

get users Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get users  &{kwargs}
   expect status is 200  ${resp}  server_account/get_users_200.json

get users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get users  &{kwargs}
   expect status is 422  ${resp}

get roles Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get roles  &{kwargs}
   expect status is 200  ${resp}  server_account/get_roles_200.json

get users by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get users by username  &{kwargs}
   expect status is 200  ${resp}  server_account/get_users_by_username_200.json

get users by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get users by username  &{kwargs}
   expect status is 404  ${resp}


put users password by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put users password by username  &{kwargs}
   expect status is 204  ${resp}

put users password by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put users password by username  &{kwargs}
   expect status is 404  ${resp}

put users password by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put users password by username  &{kwargs}
   expect status is 422  ${resp}

put users by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put users by username  &{kwargs}
   expect status is 204  ${resp}

put users by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put users by username  &{kwargs}
   expect status is 404  ${resp}

put users by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put users by username  &{kwargs}
   expect status is 422  ${resp}

put users roles by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put users roles by username  &{kwargs}
   expect status is 204  ${resp}

put users roles by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put users roles by username  &{kwargs}
   expect status is 404  ${resp}

put users roles by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put users roles by username  &{kwargs}
   expect status is 422  ${resp}

delete users by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete users by username  &{kwargs}
   expect status is 204  ${resp}

delete users by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete users by username  &{kwargs}
   expect status is 404  ${resp}

