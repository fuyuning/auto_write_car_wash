*** Settings ***
Documentation  wxmp_wash_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_group.WashGroupLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_group  车主微信端


*** Test Cases ***
Post wash_group Fail Without Login
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post user wash groups Fail 403  ${essential_params}  ${unessential_params}



Post wash_group Success 
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post user wash groups Success 201  ${essential_params}  ${unessential_params}



Post wash_group Fail With Wrong Params
   [Documentation]  接口名:用户创建拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_able_group_id=${wash_able_group_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Post user wash groups Fail 422  ${essential_params}  ${unessential_params}



Get wash_group Success 
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get user wash able groups Success 200  ${essential_params}  ${unessential_params}



Get wash_group Fail Without Login
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get user wash able groups Fail 403  ${essential_params}  ${unessential_params}



Get wash_group Fail With Wrong Params
   [Documentation]  接口名:查询某区域用户能否创建拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  
   run every case by params  Get user wash able groups Fail 422  ${essential_params}  ${unessential_params}



Get wash_group Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash groups Fail 403  ${essential_params}  ${unessential_params}



Get wash_group Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash groups Success 200  ${essential_params}  ${unessential_params}



Get wash_group Fail With Wrong Params
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash groups Fail 422  ${essential_params}  ${unessential_params}



Get wash_group By Id Fail With Wrong Url
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get wash groups By Id Fail 404  wash_group_id=${wrong_url_id}



Get wash_group By Id Fail Without Login
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get wash groups By Id Fail 403  wash_group_id=${wash_group_id}



Get wash_group By Id Success 
   [Documentation]  接口名:获取单个拼团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 对象。
   [Tags]           Respcode:200
   Get wash groups By Id Success 200  wash_group_id=${wash_group_id}



*** Variables ***
${wash_group_id}


*** Keywords ***
Post User wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user wash groups   &{kwargs}
   expect status is 403  ${resp}  

Post User wash groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user wash groups   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_group/Post_User_wash_groups_201.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Post User wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user wash groups   &{kwargs}
   expect status is 422  ${resp}  

Get User wash able groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash able groups   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_User_wash_able_groups_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get User wash able groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash able groups   &{kwargs}
   expect status is 403  ${resp}  

Get User wash able groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash able groups   &{kwargs}
   expect status is 422  ${resp}  

Get Wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups   &{kwargs}
   expect status is 403  ${resp}  

Get Wash groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_Wash_groups_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups   &{kwargs}
   expect status is 422  ${resp}  

Get Wash groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups by wash group id  &{kwargs}
   expect status is 404  ${resp}  

Get Wash groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups by wash group id  &{kwargs}
   expect status is 403  ${resp}  

Get Wash groups By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash groups by wash group id  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_group/Get_Wash_groups_By_Id_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

