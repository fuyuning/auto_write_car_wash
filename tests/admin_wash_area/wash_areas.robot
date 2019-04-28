*** Settings ***
Documentation  admin_wash_area
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_area  虾洗后台


*** Test Cases ***
post admin wash areas Success 
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  post admin wash areas Success 201  ${essential_params}  ${unessential_params}

post admin wash areas Fail With Wrong Params
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  province=${province_422}  city=${city_422}  district=${district_422}  service_type=${service_type_422}  
   ${unessential_params}  create list  wash_normal=ThisIsRobot!  wash_group=ThisIsRobot!  user_group=ThisIsRobot!  enabled=ThisIsRobot!  
   run every case by params  post admin wash areas Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin wash areas Success 
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  get admin wash areas Success 200  ${essential_params}  ${unessential_params}

get admin wash areas Fail With Wrong Params
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create list  name=${name_422}  enabled=ThisIsRobot!  
   run every case by params  get admin wash areas Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin wash areas by wash area id Fail With Wrong Url
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wash areas by wash area id Fail 404    wash_area_id=${w}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${r}

put admin wash areas by wash area id Success 
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  put admin wash areas by wash area id Success 204  ${essential_params}  ${unessential_params}    wash_area_id=${wash_area_id}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

put admin wash areas by wash area id Fail With Wrong Url
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  put admin wash areas by wash area id Fail 404  ${essential_params}  ${unessential_params}    wash_area_id=${w}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${r}

put admin wash areas by wash area id Fail With Wrong Params
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  province=${province_422}  city=${city_422}  district=${district_422}  service_type=${service_type_422}  
   ${unessential_params}  create list  wash_normal=ThisIsRobot!  wash_group=ThisIsRobot!  user_group=ThisIsRobot!  enabled=ThisIsRobot!  
   run every case by params  put admin wash areas by wash area id Fail 422  ${essential_params}  ${unessential_params}    wash_area_id=${wash_area_id}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  success=False

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Success 
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Success 204  ${essential_params}  ${unessential_params}    wash_area_id=${wash_area_id}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail With Wrong Url
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail 404  ${essential_params}  ${unessential_params}    wash_area_id=${w}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${r}

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail With Wrong Params
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=ThisIsRobot!  wash_group=ThisIsRobot!  user_group=ThisIsRobot!  enabled=ThisIsRobot!  
   run every case by params  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail 422  ${essential_params}  ${unessential_params}    wash_area_id=${wash_area_id}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  success=False

delete admin wash areas by wash area id Success 
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wash areas by wash area id Success 204    wash_area_id=${wash_area_id}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

delete admin wash areas by wash area id Fail With Wrong Url
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wash areas by wash area id Fail 404    wash_area_id=${w}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${r}


*** Variables ***
${wash_area_id}  
${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  


*** Keywords ***
post admin wash areas Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas  &{kwargs}
   expect status is 201  ${resp}  admin_wash_area/post_admin_wash_areas_201.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

post admin wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas  &{kwargs}
   expect status is 422  ${resp}  

get admin wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas  &{kwargs}
   expect status is 200  ${resp}  admin_wash_area/get_admin_wash_areas_200.json
   ${wash_area_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id]}
   set global variable   ${wash_area_id}
   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_area_id/(wash_normal|wash_group|user_group|enabled)]}
   set global variable   ${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

get admin wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas  &{kwargs}
   expect status is 422  ${resp}  

get admin wash areas by wash area id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash areas by wash area id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 204  ${resp}  

put admin wash areas by wash area id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash areas by wash area id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 422  ${resp}  

delete admin wash areas by wash area id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 204  ${resp}  

delete admin wash areas by wash area id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 404  ${resp}  

