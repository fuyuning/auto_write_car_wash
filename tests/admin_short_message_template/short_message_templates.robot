*** Settings ***
Documentation  admin_short_message_template
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message_template.ShortMessageTemplateLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_short_message_template  虾洗后台


*** Test Cases ***
post admin short message templates Fail With Wrong Params
   [Documentation]  接口名:添加短信模版${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  type=${type_422}  content=${content_422}  
   ${unessential_params}  create dictionary  enabled=ThisIsRobot!  
   run every case by params   post admin short message templates fail 422   ${essential_params}  ${unessential_params}  success=False

post admin short message templates Success 
   [Documentation]  接口名:添加短信模版${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  type=${type}  content=${content}  
   ${unessential_params}  create dictionary  enabled=False  
   run every case by params   post admin short message templates success 201   ${essential_params}  ${unessential_params}

get admin short message templates Success 
   [Documentation]  接口名:查询短信模版${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ShortMessageTemplate 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  content=${content}  type=${type}  enabled=False  smt_id=${smt_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin short message templates success 200   ${essential_params}  ${unessential_params}

get admin short message templates Fail With Wrong Params
   [Documentation]  接口名:查询短信模版${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  content=${content_422}  type=${type_422}  enabled=ThisIsRobot!  smt_id=${smt_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin short message templates fail 422   ${essential_params}  ${unessential_params}  success=False

put admin short message templates by smt id Fail With Wrong Url
   [Documentation]  接口名:修改短信模版${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin short message templates by smt id fail 404     smt_id=${wrong_url_id}  name=${name}  type=${type}  content=${content}    enabled=False  

put admin short message templates by smt id Fail With Wrong Params
   [Documentation]  接口名:修改短信模版${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  type=${type_422}  content=${content_422}  
   ${unessential_params}  create dictionary  enabled=ThisIsRobot!  
   run every case by params   put admin short message templates by smt id fail 422   ${essential_params}  ${unessential_params}    smt_id=${smt_id}  success=False

put admin short message templates by smt id Success 
   [Documentation]  接口名:修改短信模版${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  name=${name}  type=${type}  content=${content}  
   ${unessential_params}  create dictionary  enabled=False  
   run every case by params   put admin short message templates by smt id success 204   ${essential_params}  ${unessential_params}    smt_id=${smt_id}

patch admin short message templates by smt id Fail With Wrong Url
   [Documentation]  接口名:启用/禁用短信模版${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin short message templates by smt id fail 404     smt_id=${wrong_url_id}  enabled=False    

patch admin short message templates by smt id Fail With Wrong Params
   [Documentation]  接口名:启用/禁用短信模版${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  enabled=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin short message templates by smt id fail 422   ${essential_params}  ${unessential_params}    smt_id=${smt_id}  success=False

patch admin short message templates by smt id Success 
   [Documentation]  接口名:启用/禁用短信模版${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  enabled=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin short message templates by smt id success 204   ${essential_params}  ${unessential_params}    smt_id=${smt_id}

delete admin short message templates by smt id Success 
   [Documentation]  接口名:删除短信模版${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin short message templates by smt id success 204     smt_id=${smt_id}

delete admin short message templates by smt id Fail With Wrong Url
   [Documentation]  接口名:删除短信模版${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin short message templates by smt id fail 404     smt_id=${wrong_url_id}


*** Variables ***
${smt_id}  


*** Keywords ***
post admin short message templates Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin short message templates  &{kwargs}
   expect status is 422  ${resp}  

post admin short message templates Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin short message templates  &{kwargs}
   expect status is 201  ${resp}  admin_short_message_template/post_admin_short_message_templates_201.json
   ${smt_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['smt_id']}
   set global variable   ${smt_id}

get admin short message templates Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin short message templates  &{kwargs}
   expect status is 200  ${resp}  admin_short_message_template/get_admin_short_message_templates_200.json
   ${smt_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['smt_id']}
   set global variable   ${smt_id}

get admin short message templates Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin short message templates  &{kwargs}
   expect status is 422  ${resp}  

put admin short message templates by smt id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin short message templates by smt id  &{kwargs}
   expect status is 404  ${resp}  

put admin short message templates by smt id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin short message templates by smt id  &{kwargs}
   expect status is 422  ${resp}  

put admin short message templates by smt id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin short message templates by smt id  &{kwargs}
   expect status is 204  ${resp}  

patch admin short message templates by smt id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short message templates by smt id  &{kwargs}
   expect status is 404  ${resp}  

patch admin short message templates by smt id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short message templates by smt id  &{kwargs}
   expect status is 422  ${resp}  

patch admin short message templates by smt id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short message templates by smt id  &{kwargs}
   expect status is 204  ${resp}  

delete admin short message templates by smt id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short message templates by smt id  &{kwargs}
   expect status is 204  ${resp}  

delete admin short message templates by smt id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short message templates by smt id  &{kwargs}
   expect status is 404  ${resp}  

