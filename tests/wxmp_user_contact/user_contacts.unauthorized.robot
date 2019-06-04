*** Settings ***
Documentation  wxmp_user_contact
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_contact.UserContactLibrary
Force Tags  model:wxmp_user_contact  车主微信端


*** Test Cases ***
post user user contacts Fail Without Login
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user user contacts fail 403   mobile=${mobile}  name=${name}  car_type=${car_type}    

get user user contacts by user contact id Fail Without Login
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user user contacts by user contact id fail 403     user_contact_id=${user_contact_id}

get user user contacts Fail Without Login
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user user contacts fail 403

put user user contacts by user contact id Fail Without Login
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put user user contacts by user contact id fail 403     user_contact_id=${user_contact_id}    mobile=${mobile}  name=${name}  car_type=${car_type}  

put user user contacts is default by user contact id Fail Without Login
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put user user contacts is default by user contact id fail 403     user_contact_id=${user_contact_id}

delete user user contacts by user contact id Fail Without Login
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete user user contacts by user contact id fail 403     user_contact_id=${user_contact_id}


*** Variables ***
${user_contact_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post user user contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user user contacts  &{kwargs}
   expect status is 403  ${resp}  

get user user contacts by user contact id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user contacts by user contact id  &{kwargs}
   expect status is 403  ${resp}  

get user user contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user contacts  &{kwargs}
   expect status is 403  ${resp}  

put user user contacts by user contact id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts by user contact id  &{kwargs}
   expect status is 403  ${resp}  

put user user contacts is default by user contact id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts is default by user contact id  &{kwargs}
   expect status is 403  ${resp}  

delete user user contacts by user contact id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete user user contacts by user contact id  &{kwargs}
   expect status is 403  ${resp}  

