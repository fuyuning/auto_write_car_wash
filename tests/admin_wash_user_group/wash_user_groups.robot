*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_group  虾洗后台


*** Test Cases ***
Post Admin Wash User Groups Fail With Wrong Params
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wash User Groups Fail 422  ${essential_params}  ${unessential_params}

Post Admin Wash User Groups Success 
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wash User Groups Success 201  ${essential_params}  ${unessential_params}

Get Admin Wash User Groups Success 
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 wash_user_group 列表。
   [Tags]           Respcode:200
    Get Admin Wash User Groups Success 200

Get Admin Wash User Groups By Wash User Group Id Fail With Wrong Url
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wash User Groups By Wash User Group Id Fail 404  wash_user_group_id=${wrong_url_id}

Put Admin Wash User Groups By Wash User Group Id Fail With Wrong Params
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wash User Groups By Wash User Group Id Fail 422  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}

Put Admin Wash User Groups By Wash User Group Id Success 
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wash User Groups By Wash User Group Id Success 204  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}

Put Admin Wash User Groups By Wash User Group Id Fail With Wrong Url
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wash User Groups By Wash User Group Id Fail 404  ${essential_params}  ${unessential_params}  wash_user_group_id=${wrong_url_id}

Delete Admin Wash User Groups By Wash User Group Id Success 
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wash User Groups By Wash User Group Id Success 204  wash_user_group_id=${wash_user_group_id}

Delete Admin Wash User Groups By Wash User Group Id Fail With Wrong Url
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wash User Groups By Wash User Group Id Fail 404  wash_user_group_id=${wrong_url_id}


*** Variables ***
${wash_user_group_id}  


*** Keywords ***
Post Admin Wash User Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash User Groups   &{kwargs}
   expect status is 422  ${resp}  

Post Admin Wash User Groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash User Groups   &{kwargs}
   expect status is 201  ${resp}  admin_wash_user_group/Post_Admin_Wash_User_Groups_201.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

Get Admin Wash User Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_group/Get_Admin_Wash_User_Groups_200.json
   ${wash_user_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_group_id]}
   set global variable   ${wash_user_group_id}

Get Admin Wash User Groups By Wash User Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wash User Groups By Wash User Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Wash User Groups By Wash User Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wash User Groups By Wash User Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wash User Groups By Wash User Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Wash User Groups By Wash User Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 404  ${resp}  

