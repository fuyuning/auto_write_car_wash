*** Settings ***
Documentation  admin_admin_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_user.AdminUserLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_admin_user  虾洗后台


*** Test Cases ***
post admin admin users Success 
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create dictionary  email=${email}  a=111111
   run every case by params   post admin admin users success 201   ${essential_params}  ${unessential_params}

post admin admin users Fail With Wrong Params
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  name=${name_422}  mobile=${mobile_422}  password=${password_422}  
   ${unessential_params}  create dictionary  email=${email_422}  
   run every case by params   post admin admin users fail 422   ${essential_params}  ${unessential_params}  success=False

post admin login Success 
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  password=${password}  username=${username}  vk=${vk}  
   ${unessential_params}  create dictionary  num=${num}  
   run every case by params   post admin login success 204   ${essential_params}  ${unessential_params}

post admin login Fail With Wrong Params
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  password=${password_422}  username=${username_422}  vk=${vk_422}  
   ${unessential_params}  create dictionary  num=${num_422}  
   run every case by params   post admin login fail 422   ${essential_params}  ${unessential_params}  success=False

post admin logout Success 
   [Documentation]  接口名:帐号注销${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
    post admin logout success 204

get admin admin users Success 
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  username=${username}  name=${name}  mobile=${mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin admin users success 200   ${essential_params}  ${unessential_params}

get admin admin users Fail With Wrong Params
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  username=${username_422}  name=${name_422}  mobile=${mobile_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin admin users fail 422   ${essential_params}  ${unessential_params}  success=False

get admin admin users by username Fail With Wrong Url
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin admin users by username fail 404     username=${wrong_url_id}

get admin admin users by username Success 
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 对象。
   [Tags]           Respcode:200
   get admin admin users by username success 200     username=${username}

get admin user Success 
   [Documentation]  接口名:获取信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
    get admin user success 200

get admin get verify code Success 
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  vk=${vk}  
   ${unessential_params}  create dictionary  num=${num}  
   run every case by params   get admin get verify code success 200   ${essential_params}  ${unessential_params}

get admin get verify code Fail With Wrong Params
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  vk=${vk_422}  
   ${unessential_params}  create dictionary  num=${num_422}  
   run every case by params   get admin get verify code fail 422   ${essential_params}  ${unessential_params}  success=False

put admin admin users by username Success 
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create dictionary  email=${email}  
   run every case by params   put admin admin users by username success 204   ${essential_params}  ${unessential_params}    username=${username}

put admin admin users by username Fail With Wrong Url
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin admin users by username fail 404     username=${wrong_url_id}  username=${username}  name=${name}  mobile=${mobile}  password=${password}    email=${email}  

put admin admin users by username Fail With Wrong Params
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  name=${name_422}  mobile=${mobile_422}  password=${password_422}  
   ${unessential_params}  create dictionary  email=${email_422}  
   run every case by params   put admin admin users by username fail 422   ${essential_params}  ${unessential_params}    username=${username}  success=False

patch admin admin users is active by username Fail With Wrong Url
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin admin users is active by username fail 404     username=${wrong_url_id}  is_active=False    

patch admin admin users is active by username Success 
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  is_active=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin admin users is active by username success 204   ${essential_params}  ${unessential_params}    username=${username}

patch admin admin users is active by username Fail With Wrong Params
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  is_active=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin admin users is active by username fail 422   ${essential_params}  ${unessential_params}    username=${username}  success=False


*** Variables ***
${username}  


*** Keywords ***
post admin admin users Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin admin users  &{kwargs}
   expect status is 201  ${resp}  admin_admin_user/post_admin_admin_users_201.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['username']}
   set global variable   ${username}

post admin admin users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin admin users  &{kwargs}
   expect status is 422  ${resp}  

post admin login Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin login  &{kwargs}
   expect status is 204  ${resp}  

post admin login Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin login  &{kwargs}
   expect status is 422  ${resp}  

post admin logout Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin logout  &{kwargs}
   expect status is 204  ${resp}  

get admin admin users Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users  &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/get_admin_admin_users_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['username']}
   set global variable   ${username}

get admin admin users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users  &{kwargs}
   expect status is 422  ${resp}  

get admin admin users by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users by username  &{kwargs}
   expect status is 404  ${resp}  

get admin admin users by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin users by username  &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/get_admin_admin_users_by_username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['username']}
   set global variable   ${username}

get admin user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin user  &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/get_admin_user_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['username']}
   set global variable   ${username}

get admin get verify code Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin get verify code  &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/get_admin_get_verify_code_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['username']}
   set global variable   ${username}

get admin get verify code Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin get verify code  &{kwargs}
   expect status is 422  ${resp}  

put admin admin users by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin admin users by username  &{kwargs}
   expect status is 204  ${resp}  

put admin admin users by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin admin users by username  &{kwargs}
   expect status is 404  ${resp}  

put admin admin users by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin admin users by username  &{kwargs}
   expect status is 422  ${resp}  

patch admin admin users is active by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin admin users is active by username  &{kwargs}
   expect status is 404  ${resp}  

patch admin admin users is active by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin admin users is active by username  &{kwargs}
   expect status is 204  ${resp}  

patch admin admin users is active by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin admin users is active by username  &{kwargs}
   expect status is 422  ${resp}  

