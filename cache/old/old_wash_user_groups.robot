*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_group  虾洗后台


*** Test Cases ***
post admin wash user groups Fail With Wrong Params
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  order_by=${order_by_422}  
   ${unessential_params}  create list  
   run every case by params  post admin wash user groups Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin wash user groups Success 
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  post admin wash user groups Success 201  ${essential_params}  ${unessential_params}

get admin wash user groups Success 
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 wash_user_group 列表。
   [Tags]           Respcode:200
    get admin wash user groups Success 200

get admin wash user groups by wash user group id Fail With Wrong Url
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wash user groups by wash user group id Fail 404    wash_user_group_id=${w}

put admin wash user groups by wash user group id Fail With Wrong Params
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  order_by=${order_by_422}  
   ${unessential_params}  create list  
   run every case by params  put admin wash user groups by wash user group id Fail 422  ${essential_params}  ${unessential_params}    wash_user_group_id=${wash_user_group_id}  success=False

put admin wash user groups by wash user group id Success 
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  put admin wash user groups by wash user group id Success 204  ${essential_params}  ${unessential_params}    wash_user_group_id=${wash_user_group_id}

put admin wash user groups by wash user group id Fail With Wrong Url
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  put admin wash user groups by wash user group id Fail 404  ${essential_params}  ${unessential_params}    wash_user_group_id=${w}

delete admin wash user groups by wash user group id Success 
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wash user groups by wash user group id Success 204    wash_user_group_id=${wash_user_group_id}

delete admin wash user groups by wash user group id Fail With Wrong Url
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wash user groups by wash user group id Fail 404    wash_user_group_id=${w}


*** Variables ***
${wash_user_group_id}  


*** Keywords ***
post admin wash user groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups  &{kwargs}
   expect status is 422  ${resp}  

post admin wash user groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups  &{kwargs}
   expect status is 201  ${resp}  admin_wash_user_group/post_admin_wash_user_groups_201.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

get admin wash user groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups  &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_group/get_admin_wash_user_groups_200.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

get admin wash user groups by wash user group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash user groups by wash user group id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 422  ${resp}  

put admin wash user groups by wash user group id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 204  ${resp}  

put admin wash user groups by wash user group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wash user groups by wash user group id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 204  ${resp}  

delete admin wash user groups by wash user group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 404  ${resp}  

