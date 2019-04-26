*** Settings ***
Documentation  admin_admin_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_user.AdminUserLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_admin_user  虾洗后台


*** Test Cases ***
Post Admin Admin Users Success 
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  Post Admin Admin Users Success 201  ${essential_params}  ${unessential_params}

Post Admin Admin Users Fail With Wrong Params
   [Documentation]  接口名:添加管理员${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  username=${username_422}  name=${name_422}  mobile=${mobile_422}  password=${password_422}  
   ${unessential_params}  create list  email=${email_422}  
   run every case by params  Post Admin Admin Users Fail 422  ${essential_params}  ${unessential_params}

Post Admin Login Success 
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  password=${password}  username=${username}  vk=${vk}  
   ${unessential_params}  create list  num=${num}  
   run every case by params  Post Admin Login Success 204  ${essential_params}  ${unessential_params}

Post Admin Login Fail With Wrong Params
   [Documentation]  接口名:帐号登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  password=${password_422}  username=${username_422}  vk=${vk_422}  
   ${unessential_params}  create list  num=${num_422}  
   run every case by params  Post Admin Login Fail 422  ${essential_params}  ${unessential_params}

Post Admin Logout Success 
   [Documentation]  接口名:帐号注销${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
    Post Admin Logout Success 204

Get Admin Admin Users Success 
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Admin Users Success 200  ${essential_params}  ${unessential_params}

Get Admin Admin Users Fail With Wrong Params
   [Documentation]  接口名:获取管理员信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username_422}  name=${name_422}  mobile=${mobile_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Admin Users Fail 422  ${essential_params}  ${unessential_params}

Get Admin Admin Users By Username Fail With Wrong Url
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Admin Users By Username Fail 404  username=${wrong_url_id}

Get Admin Admin Users By Username Success 
   [Documentation]  接口名:获取管理员信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 对象。
   [Tags]           Respcode:200
   Get Admin Admin Users By Username Success 200  username=${username}

Get Admin User Success 
   [Documentation]  接口名:获取信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
    Get Admin User Success 200

Get Admin Get Verify Code Success 
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  vk=${vk}  
   ${unessential_params}  create list  num=${num}  
   run every case by params  Get Admin Get Verify Code Success 200  ${essential_params}  ${unessential_params}

Get Admin Get Verify Code Fail With Wrong Params
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  vk=${vk_422}  
   ${unessential_params}  create list  num=${num_422}  
   run every case by params  Get Admin Get Verify Code Fail 422  ${essential_params}  ${unessential_params}

Put Admin Admin Users By Username Success 
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  Put Admin Admin Users By Username Success 204  ${essential_params}  ${unessential_params}  username=${username}

Put Admin Admin Users By Username Fail With Wrong Url
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  email=${email}  
   run every case by params  Put Admin Admin Users By Username Fail 404  ${essential_params}  ${unessential_params}  username=${wrong_url_id}

Put Admin Admin Users By Username Fail With Wrong Params
   [Documentation]  接口名:修改管理员信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  username=${username_422}  name=${name_422}  mobile=${mobile_422}  password=${password_422}  
   ${unessential_params}  create list  email=${email_422}  
   run every case by params  Put Admin Admin Users By Username Fail 422  ${essential_params}  ${unessential_params}  username=${username}

Patch is Active by username Fail With Wrong Url
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Fail 404  ${essential_params}  ${unessential_params}  username/is_active=${wrong_url_id}

Patch is Active by username Success 
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Success 204  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}

Patch is Active by username Fail With Wrong Params
   [Documentation]  接口名:管理员启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=ThisIsRobot!  
   run every case by params  Patch is Active by username Fail 422  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}


*** Variables ***
${username}  
${username/is_active}  


*** Keywords ***
Post Admin Admin Users Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Admin Users   &{kwargs}
   expect status is 201  ${resp}  admin_admin_user/Post_Admin_Admin_Users_201.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Post Admin Admin Users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Admin Users   &{kwargs}
   expect status is 422  ${resp}  

Post Admin Login Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Login   &{kwargs}
   expect status is 204  ${resp}  

Post Admin Login Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Login   &{kwargs}
   expect status is 422  ${resp}  

Post Admin Logout Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Logout   &{kwargs}
   expect status is 204  ${resp}  

Get Admin Admin Users Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users   &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/Get_Admin_Admin_Users_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get Admin Admin Users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Admin Users By Username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users By Username   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Admin Users By Username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Admin Users By Username   &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/Get_Admin_Admin_Users_By_Username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get Admin User Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin User   &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/Get_Admin_User_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get Admin Get Verify Code Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Get Verify Code   &{kwargs}
   expect status is 200  ${resp}  admin_admin_user/Get_Admin_Get_Verify_Code_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get Admin Get Verify Code Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Get Verify Code   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Admin Users By Username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Admin Users By Username   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Admin Users By Username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Admin Users By Username   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Admin Users By Username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Admin Users By Username   &{kwargs}
   expect status is 422  ${resp}  

Patch is Active by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 404  ${resp}  

Patch is Active by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 204  ${resp}  

Patch is Active by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 422  ${resp}  

