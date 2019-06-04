*** Settings ***
Documentation  admin_matter
Resource  ../resources.robot
Library  robot_car_wash_server_library.matter.MatterLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_matter  虾洗后台


*** Test Cases ***
post admin matters Fail With Wrong Params
   [Documentation]  接口名:新增事项${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  matter_type=${matter_type_422}  start_time=${start_time_422}  end_time=${end_time_422}  duration=${duration_422}  
   ${unessential_params}  create dictionary  reason=${reason_422}  
   run every case by params   post admin matters fail 422   ${essential_params}  ${unessential_params}  success=False

post admin matters Success 
   [Documentation]  接口名:新增事项${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  username=${username}  matter_type=${matter_type}  start_time=${start_time}  end_time=${end_time}  duration=${duration}  
   ${unessential_params}  create dictionary  reason=${reason}  
   run every case by params   post admin matters success 201   ${essential_params}  ${unessential_params}

get admin matters Success 
   [Documentation]  接口名:获取事项${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Matter 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  username=${username}  
   ${unessential_params}  create dictionary  matter_type=${matter_type}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin matters success 200   ${essential_params}  ${unessential_params}

get admin matters Fail With Wrong Params
   [Documentation]  接口名:获取事项${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  
   ${unessential_params}  create dictionary  matter_type=${matter_type_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin matters fail 422   ${essential_params}  ${unessential_params}  success=False

get admin matters by matter id Fail With Wrong Url
   [Documentation]  接口名:获取事项详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin matters by matter id fail 404     matter_id=${wrong_url_id}

get admin matters by matter id Success 
   [Documentation]  接口名:获取事项详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Matter 对象。
   [Tags]           Respcode:200
   get admin matters by matter id success 200     matter_id=${matter_id}

put admin matters by matter id Success 
   [Documentation]  接口名:编辑事项${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  username=${username}  matter_type=${matter_type}  start_time=${start_time}  end_time=${end_time}  duration=${duration}  
   ${unessential_params}  create dictionary  reason=${reason}  
   run every case by params   put admin matters by matter id success 204   ${essential_params}  ${unessential_params}    matter_id=${matter_id}

put admin matters by matter id Fail With Wrong Url
   [Documentation]  接口名:编辑事项${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin matters by matter id fail 404     matter_id=${wrong_url_id}  username=${username}  matter_type=${matter_type}  start_time=${start_time}  end_time=${end_time}  duration=${duration}    reason=${reason}  

put admin matters by matter id Fail With Wrong Params
   [Documentation]  接口名:编辑事项${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  matter_type=${matter_type_422}  start_time=${start_time_422}  end_time=${end_time_422}  duration=${duration_422}  
   ${unessential_params}  create dictionary  reason=${reason_422}  
   run every case by params   put admin matters by matter id fail 422   ${essential_params}  ${unessential_params}    matter_id=${matter_id}  success=False


*** Variables ***
${matter_id}  


*** Keywords ***
post admin matters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin matters  &{kwargs}
   expect status is 422  ${resp}  

post admin matters Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin matters  &{kwargs}
   expect status is 201  ${resp}  admin_matter/post_admin_matters_201.json
   ${matter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['matter_id']}
   set global variable   ${matter_id}

get admin matters Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters  &{kwargs}
   expect status is 200  ${resp}  admin_matter/get_admin_matters_200.json
   ${matter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['matter_id']}
   set global variable   ${matter_id}

get admin matters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters  &{kwargs}
   expect status is 422  ${resp}  

get admin matters by matter id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters by matter id  &{kwargs}
   expect status is 404  ${resp}  

get admin matters by matter id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin matters by matter id  &{kwargs}
   expect status is 200  ${resp}  admin_matter/get_admin_matters_by_matter_id_200.json
   ${matter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['matter_id']}
   set global variable   ${matter_id}

put admin matters by matter id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin matters by matter id  &{kwargs}
   expect status is 204  ${resp}  

put admin matters by matter id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin matters by matter id  &{kwargs}
   expect status is 404  ${resp}  

put admin matters by matter id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin matters by matter id  &{kwargs}
   expect status is 422  ${resp}  

