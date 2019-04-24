*** Settings ***
Documentation  wxmp_wash_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_group.WashGroupLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_group  车主微信端


*** Test Cases ***
Post User Wash Groups Success 
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post User Wash Groups Success 201  ${essential_params}  ${unessential_params}

Post User Wash Groups Fail With Wrong Params
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post User Wash Groups Fail 422  ${essential_params}  ${unessential_params}

Get User Wash Able Groups Success 
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get User Wash Able Groups Success 200  ${essential_params}  ${unessential_params}

Get User Wash Able Groups Fail With Wrong Params
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get User Wash Able Groups Fail 422  ${essential_params}  ${unessential_params}

Get Wash Groups Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get Wash Groups Success 200  ${essential_params}  ${unessential_params}

Get Wash Groups Fail With Wrong Params
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get Wash Groups Fail 422  ${essential_params}  ${unessential_params}

Get Wash Groups By Wash Group Id Fail With Wrong Url
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Wash Groups By Wash Group Id Fail 404  wash_group_id=${wrong_url_id}

Get Wash Groups By Wash Group Id Success 
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 对象。
   [Tags]           Respcode:200
   Get Wash Groups By Wash Group Id Success 200  wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id}  


*** Keywords ***
Post User Wash Groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Groups   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_group/Post_User_Wash_Groups_201.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Post User Wash Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Groups   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Able Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Able Groups   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_User_Wash_Able_Groups_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get User Wash Able Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Able Groups   &{kwargs}
   expect status is 422  ${resp}  

Get Wash Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_Wash_Groups_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Wash Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups   &{kwargs}
   expect status is 422  ${resp}  

Get Wash Groups By Wash Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups By Wash Group Id   &{kwargs}
   expect status is 404  ${resp}  

Get Wash Groups By Wash Group Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Groups By Wash Group Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_Wash_Groups_By_Wash_Group_Id_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

