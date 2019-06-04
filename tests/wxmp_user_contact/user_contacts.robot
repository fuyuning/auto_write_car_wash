*** Settings ***
Documentation  wxmp_user_contact
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_contact.UserContactLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_user_contact  车主微信端


*** Test Cases ***
post user user contacts Success 
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  mobile=${mobile}  name=${name}  car_type=${car_type}  
   ${unessential_params}  create dictionary  
   run every case by params   post user user contacts success 201   ${essential_params}  ${unessential_params}

post user user contacts Fail With Wrong Params
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  mobile=${mobile_422}  name=${name_422}  car_type=${car_type_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user user contacts fail 422   ${essential_params}  ${unessential_params}  success=False

get user user contacts by user contact id Success 
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserContact 对象。
   [Tags]           Respcode:200
   get user user contacts by user contact id success 200     user_contact_id=${user_contact_id}

get user user contacts by user contact id Fail With Wrong Url
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get user user contacts by user contact id fail 404     user_contact_id=${wrong_url_id}

get user user contacts Success 
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserContact 列表。
   [Tags]           Respcode:200
    get user user contacts success 200

put user user contacts by user contact id Success 
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mobile=${mobile}  name=${name}  car_type=${car_type}  
   run every case by params   put user user contacts by user contact id success 204   ${essential_params}  ${unessential_params}    user_contact_id=${user_contact_id}

put user user contacts by user contact id Fail With Wrong Url
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put user user contacts by user contact id fail 404     user_contact_id=${wrong_url_id}    mobile=${mobile}  name=${name}  car_type=${car_type}  

put user user contacts by user contact id Fail With Wrong Params
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mobile=${mobile_422}  name=${name_422}  car_type=${car_type_422}  
   run every case by params   put user user contacts by user contact id fail 422   ${essential_params}  ${unessential_params}    user_contact_id=${user_contact_id}  success=False

put user user contacts is default by user contact id Success 
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   put user user contacts is default by user contact id success 204     user_contact_id=${user_contact_id}

put user user contacts is default by user contact id Fail With Wrong Url
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put user user contacts is default by user contact id fail 404     user_contact_id=${wrong_url_id}

delete user user contacts by user contact id Fail With Wrong Url
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete user user contacts by user contact id fail 404     user_contact_id=${wrong_url_id}

delete user user contacts by user contact id Success 
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete user user contacts by user contact id success 204     user_contact_id=${user_contact_id}


*** Variables ***
${user_contact_id}  


*** Keywords ***
post user user contacts Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user user contacts  &{kwargs}
   expect status is 201  ${resp}  wxmp_user_contact/post_user_user_contacts_201.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_contact_id']}
   set global variable   ${user_contact_id}

post user user contacts Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user user contacts  &{kwargs}
   expect status is 422  ${resp}  

get user user contacts by user contact id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user contacts by user contact id  &{kwargs}
   expect status is 200  ${resp}  wxmp_user_contact/get_user_user_contacts_by_user_contact_id_200.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_contact_id']}
   set global variable   ${user_contact_id}

get user user contacts by user contact id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user user contacts by user contact id  &{kwargs}
   expect status is 404  ${resp}  

get user user contacts Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user contacts  &{kwargs}
   expect status is 200  ${resp}  wxmp_user_contact/get_user_user_contacts_200.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_contact_id']}
   set global variable   ${user_contact_id}

put user user contacts by user contact id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts by user contact id  &{kwargs}
   expect status is 204  ${resp}  

put user user contacts by user contact id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts by user contact id  &{kwargs}
   expect status is 404  ${resp}  

put user user contacts by user contact id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts by user contact id  &{kwargs}
   expect status is 422  ${resp}  

put user user contacts is default by user contact id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts is default by user contact id  &{kwargs}
   expect status is 204  ${resp}  

put user user contacts is default by user contact id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put user user contacts is default by user contact id  &{kwargs}
   expect status is 404  ${resp}  

delete user user contacts by user contact id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete user user contacts by user contact id  &{kwargs}
   expect status is 404  ${resp}  

delete user user contacts by user contact id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete user user contacts by user contact id  &{kwargs}
   expect status is 204  ${resp}  

