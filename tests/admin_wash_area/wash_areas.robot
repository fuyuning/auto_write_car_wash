*** Settings ***
Documentation  admin_wash_area
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_area  虾洗后台


*** Test Cases ***
Post Admin Wash Areas Success 
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post Admin Wash Areas Success 201  ${essential_params}  ${unessential_params}

Post Admin Wash Areas Fail With Wrong Params
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post Admin Wash Areas Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wash Areas Success 
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get Admin Wash Areas Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash Areas Fail With Wrong Params
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get Admin Wash Areas Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wash Areas By Wash Area Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wash Areas By Wash Area Id Fail 404  wash_area_id=${wrong_url_id}

Put Admin Wash Areas By Wash Area Id Success 
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put Admin Wash Areas By Wash Area Id Success 204  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}

Put Admin Wash Areas By Wash Area Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put Admin Wash Areas By Wash Area Id Fail 404  ${essential_params}  ${unessential_params}  wash_area_id=${wrong_url_id}

Put Admin Wash Areas By Wash Area Id Fail With Wrong Params
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put Admin Wash Areas By Wash Area Id Fail 422  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Success 
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch (wash Normal|wash Group|user Group|enabled) by wash area id Success 204  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail With Wrong Url
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 404  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wrong_url_id}

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail With Wrong Params
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 422  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Delete Admin Wash Areas By Wash Area Id Success 
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wash Areas By Wash Area Id Success 204  wash_area_id=${wash_area_id}

Delete Admin Wash Areas By Wash Area Id Fail With Wrong Url
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wash Areas By Wash Area Id Fail 404  wash_area_id=${wrong_url_id}


*** Variables ***
${wash_area_id}  
${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  


*** Keywords ***
Post Admin Wash Areas Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Areas   &{kwargs}
   expect status is 201  ${resp}  admin_wash_area/Post_Admin_Wash_Areas_201.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Post Admin Wash Areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Areas   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Areas   &{kwargs}
   expect status is 200  ${resp}  admin_wash_area/Get_Admin_Wash_Areas_200.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Get Admin Wash Areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Areas   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Areas By Wash Area Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wash Areas By Wash Area Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wash Areas By Wash Area Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wash Areas By Wash Area Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 422  ${resp}  

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch (wash Normal|wash Group|user Group|enabled) by wash area id   &{kwargs}
   expect status is 204  ${resp}  

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch (wash Normal|wash Group|user Group|enabled) by wash area id   &{kwargs}
   expect status is 404  ${resp}  

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch (wash Normal|wash Group|user Group|enabled) by wash area id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Wash Areas By Wash Area Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Wash Areas By Wash Area Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 404  ${resp}  

