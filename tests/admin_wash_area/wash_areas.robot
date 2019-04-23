*** Settings ***
Documentation  admin_wash_area
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_area  虾洗后台


*** Test Cases ***
Post wash_area Success 
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post admin wash areas Success 201  ${essential_params}  ${unessential_params}



Post wash_area Fail Without Login
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post admin wash areas Fail 403  ${essential_params}  ${unessential_params}



Post wash_area Fail With Wrong Params
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post admin wash areas Fail 422  ${essential_params}  ${unessential_params}



Get wash_area Success 
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get admin wash areas Success 200  ${essential_params}  ${unessential_params}



Get wash_area Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get admin wash areas Fail 403  ${essential_params}  ${unessential_params}



Get wash_area Fail With Wrong Params
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get admin wash areas Fail 422  ${essential_params}  ${unessential_params}



Get wash_area By Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin wash areas By Id Fail 404  wash_area_id=${wrong_url_id}



Get wash_area By Id Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin wash areas By Id Fail 403  wash_area_id=${wash_area_id}



Put wash_area By Id Success 
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put admin wash areas By Id Success 204  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}



Put wash_area By Id Fail Without Login
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put admin wash areas By Id Fail 403  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}



Put wash_area By Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put admin wash areas By Id Fail 404  ${essential_params}  ${unessential_params}  wash_area_id=${wrong_url_id}



Put wash_area By Id Fail With Wrong Params
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put admin wash areas By Id Fail 422  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}



Patch wash_area By Id Success 
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch admin wash areas By Id Success 204  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}



Patch wash_area By Id Fail Without Login
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch admin wash areas By Id Fail 403  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}



Patch wash_area By Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch admin wash areas By Id Fail 404  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wrong_url_id}



Patch wash_area By Id Fail With Wrong Params
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch admin wash areas By Id Fail 422  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}



Delete wash_area By Id Success 
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin wash areas By Id Success 204  wash_area_id=${wash_area_id}



Delete wash_area By Id Fail Without Login
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash areas By Id Fail 403  wash_area_id=${wash_area_id}



Delete wash_area By Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin wash areas By Id Fail 404  wash_area_id=${wrong_url_id}



*** Variables ***
${wash_area_id}
${wash_area_id/(wash_normal|wash_group|user_group|enabled)}


*** Keywords ***
Post Admin wash areas Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas   &{kwargs}
   expect status is 201  ${resp}  admin_wash_area/Post_Admin_wash_areas_201.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Post Admin wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas   &{kwargs}
   expect status is 403  ${resp}  

Post Admin wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas   &{kwargs}
   expect status is 422  ${resp}  

Get Admin wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas   &{kwargs}
   expect status is 200  ${resp}  admin_wash_area/Get_Admin_wash_areas_200.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Get Admin wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas   &{kwargs}
   expect status is 422  ${resp}  

Get Admin wash areas By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin wash areas By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wash areas By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wash areas By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wash areas By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin wash areas By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 422  ${resp}  

Patch Admin wash areas By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin wash areas By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash areas By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin wash areas By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 422  ${resp}  

Delete Admin wash areas By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin wash areas By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash areas By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

