*** Settings ***
Documentation  admin_short_message
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message.ShortMessageLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_short_message  虾洗后台


*** Test Cases ***
post admin short messages Fail With Wrong Params
   [Documentation]  接口名:添加短信通知${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  smt_id=${smt_id_422}  name=${name_422}  content=${content_422}  
   ${unessential_params}  create dictionary  user_id=${user_id_422}  test_mobile=${test_mobile_422}  remark=${remark_422}  
   run every case by params   post admin short messages fail 422   ${essential_params}  ${unessential_params}  success=False

post admin short messages Success 
   [Documentation]  接口名:添加短信通知${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  smt_id=${smt_id}  name=${name}  content=${content}  
   ${unessential_params}  create dictionary  user_id=${user_id}  test_mobile=${test_mobile}  remark=${remark}  
   run every case by params   post admin short messages success 204   ${essential_params}  ${unessential_params}

get admin short messages Success 
   [Documentation]  接口名:查询短信通知${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ShortMessage 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  type=${type}  remark=${remark}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin short messages success 200   ${essential_params}  ${unessential_params}

get admin short messages Fail With Wrong Params
   [Documentation]  接口名:查询短信通知${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  type=${type_422}  remark=${remark_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin short messages fail 422   ${essential_params}  ${unessential_params}  success=False

get admin short messages by sm id Success 
   [Documentation]  接口名:查询短信通知记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ShortMessageRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user_id=${user_id}  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin short messages by sm id success 200   ${essential_params}  ${unessential_params}    sm_id=${sm_id}

get admin short messages by sm id Fail With Wrong Params
   [Documentation]  接口名:查询短信通知记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user_id=${user_id_422}  status=${status_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin short messages by sm id fail 422   ${essential_params}  ${unessential_params}    sm_id=${sm_id}  success=False

get admin short messages by sm id Fail With Wrong Url
   [Documentation]  接口名:查询短信通知记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin short messages by sm id fail 404     sm_id=${wrong_url_id}    user_id=${user_id}  status=${status}  page_num=${page_num}  page_size=${page_size}  

patch admin short messages by sm id Fail With Wrong Url
   [Documentation]  接口名:备注短信通知${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin short messages by sm id fail 404     sm_id=${wrong_url_id}  remark=${remark}    

patch admin short messages by sm id Fail With Wrong Params
   [Documentation]  接口名:备注短信通知${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  remark=${remark_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin short messages by sm id fail 422   ${essential_params}  ${unessential_params}    sm_id=${sm_id}  success=False

patch admin short messages by sm id Success 
   [Documentation]  接口名:备注短信通知${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  remark=${remark}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin short messages by sm id success 204   ${essential_params}  ${unessential_params}    sm_id=${sm_id}

delete admin short messages by sm id Success 
   [Documentation]  接口名:删除短信通知${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin short messages by sm id success 204     sm_id=${sm_id}

delete admin short messages by sm id Fail With Wrong Url
   [Documentation]  接口名:删除短信通知${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin short messages by sm id fail 404     sm_id=${wrong_url_id}


*** Variables ***
${sm_id}  


*** Keywords ***
post admin short messages Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin short messages  &{kwargs}
   expect status is 422  ${resp}  

post admin short messages Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin short messages  &{kwargs}
   expect status is 204  ${resp}  

get admin short messages Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages  &{kwargs}
   expect status is 200  ${resp}  admin_short_message/get_admin_short_messages_200.json
   ${sm_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['sm_id']}
   set global variable   ${sm_id}

get admin short messages Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages  &{kwargs}
   expect status is 422  ${resp}  

get admin short messages by sm id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages by sm id  &{kwargs}
   expect status is 200  ${resp}  admin_short_message/get_admin_short_messages_by_sm_id_200.json
   ${sm_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['sm_id']}
   set global variable   ${sm_id}

get admin short messages by sm id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages by sm id  &{kwargs}
   expect status is 422  ${resp}  

get admin short messages by sm id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin short messages by sm id  &{kwargs}
   expect status is 404  ${resp}  

patch admin short messages by sm id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short messages by sm id  &{kwargs}
   expect status is 404  ${resp}  

patch admin short messages by sm id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short messages by sm id  &{kwargs}
   expect status is 422  ${resp}  

patch admin short messages by sm id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short messages by sm id  &{kwargs}
   expect status is 204  ${resp}  

delete admin short messages by sm id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short messages by sm id  &{kwargs}
   expect status is 204  ${resp}  

delete admin short messages by sm id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short messages by sm id  &{kwargs}
   expect status is 404  ${resp}  

