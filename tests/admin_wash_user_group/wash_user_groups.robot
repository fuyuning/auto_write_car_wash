*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_group  虾洗后台


*** Test Cases ***
Post wash_user_group Success 
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash user groups Success 201  ${essential_params}  ${unessential_params}



Post wash_user_group Fail With Wrong Params
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash user groups Fail 422  ${essential_params}  ${unessential_params}



Post wash_user_group Fail Without Login
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash user groups Fail 403  ${essential_params}  ${unessential_params}



Get wash_user_group Fail Without Login
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get admin wash user groups Fail 403


Get wash_user_group Success 
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 wash_user_group 列表。
   [Tags]           Respcode:200
    Get admin wash user groups Success 200


Get wash_user_group By Id Fail With Wrong Url
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin wash user groups By Id Fail 404  wash_user_group_id=${wrong_url_id}



Get wash_user_group By Id Fail Without Login
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin wash user groups By Id Fail 403  wash_user_group_id=${wash_user_group_id}



Put wash_user_group By Id Success 
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put admin wash user groups By Id Success 204  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}



Put wash_user_group By Id Fail With Wrong Params
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put admin wash user groups By Id Fail 422  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}



Put wash_user_group By Id Fail Without Login
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put admin wash user groups By Id Fail 403  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}



Put wash_user_group By Id Fail With Wrong Url
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put admin wash user groups By Id Fail 404  ${essential_params}  ${unessential_params}  wash_user_group_id=${wrong_url_id}



Delete wash_user_group By Id Success 
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin wash user groups By Id Success 204  wash_user_group_id=${wash_user_group_id}



Delete wash_user_group By Id Fail Without Login
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash user groups By Id Fail 403  wash_user_group_id=${wash_user_group_id}



Delete wash_user_group By Id Fail With Wrong Url
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin wash user groups By Id Fail 404  wash_user_group_id=${wrong_url_id}



*** Variables ***
${wash_user_group_id}


*** Keywords ***
Post Admin wash user groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups   &{kwargs}
   expect status is 201  ${resp}  admin_wash_user_group/Post_Admin_wash_user_groups_201.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

Post Admin wash user groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups   &{kwargs}
   expect status is 422  ${resp}  

Post Admin wash user groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash user groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash user groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_group/Get_Admin_wash_user_groups_200.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

Get Admin wash user groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin wash user groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wash user groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wash user groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin wash user groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wash user groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wash user groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin wash user groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash user groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

