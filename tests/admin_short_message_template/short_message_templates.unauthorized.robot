*** Settings ***
Documentation  admin_short_message_template
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message_template.ShortMessageTemplateLibrary
Force Tags  model:admin_short_message_template  虾洗后台


*** Test Cases ***
post admin short message templates Fail Without Login
   [Documentation]  接口名:添加短信模版${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin short message templates fail 403   name=${name}  type=${type}  content=${content}    enabled=False  

get admin short message templates Fail Without Login
   [Documentation]  接口名:查询短信模版${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin short message templates fail 403     name=${name}  content=${content}  type=${type}  enabled=False  smt_id=${smt_id}  page_num=${page_num}  page_size=${page_size}  

put admin short message templates by smt id Fail Without Login
   [Documentation]  接口名:修改短信模版${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin short message templates by smt id fail 403     smt_id=${smt_id}  name=${name}  type=${type}  content=${content}    enabled=False  

patch admin short message templates by smt id Fail Without Login
   [Documentation]  接口名:启用/禁用短信模版${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin short message templates by smt id fail 403     smt_id=${smt_id}  enabled=False    

delete admin short message templates by smt id Fail Without Login
   [Documentation]  接口名:删除短信模版${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin short message templates by smt id fail 403     smt_id=${smt_id}


*** Variables ***
${smt_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin short message templates Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin short message templates  &{kwargs}
   expect status is 403  ${resp}  

get admin short message templates Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin short message templates  &{kwargs}
   expect status is 403  ${resp}  

put admin short message templates by smt id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin short message templates by smt id  &{kwargs}
   expect status is 403  ${resp}  

patch admin short message templates by smt id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin short message templates by smt id  &{kwargs}
   expect status is 403  ${resp}  

delete admin short message templates by smt id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin short message templates by smt id  &{kwargs}
   expect status is 403  ${resp}  

