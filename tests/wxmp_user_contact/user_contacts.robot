*** Settings ***
Documentation  wxmp_user_contact
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_contact.UserContactLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_user_contact  车主微信端


*** Test Cases ***
Post User User Contacts Success 
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_type=${car_type}  
   ${unessential_params}  create list  
   run every case by params  Post User User Contacts Success 201  ${essential_params}  ${unessential_params}

Post User User Contacts Fail With Wrong Params
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile_422}  name=${name_422}  car_type=${car_type_422}  
   ${unessential_params}  create list  
   run every case by params  Post User User Contacts Fail 422  ${essential_params}  ${unessential_params}

Get User User Contacts By User Contact Id Success 
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserContact 对象。
   [Tags]           Respcode:200
   Get User User Contacts By User Contact Id Success 200  user_contact_id=${user_contact_id}

Get User User Contacts By User Contact Id Fail With Wrong Url
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get User User Contacts By User Contact Id Fail 404  user_contact_id=${wrong_url_id}

Get User User Contacts Success 
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserContact 列表。
   [Tags]           Respcode:200
    Get User User Contacts Success 200

Put User User Contacts By User Contact Id Success 
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  name=${name}  car_type=${car_type}  
   run every case by params  Put User User Contacts By User Contact Id Success 204  ${essential_params}  ${unessential_params}  user_contact_id=${user_contact_id}

Put User User Contacts By User Contact Id Fail With Wrong Url
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  name=${name}  car_type=${car_type}  
   run every case by params  Put User User Contacts By User Contact Id Fail 404  ${essential_params}  ${unessential_params}  user_contact_id=${wrong_url_id}

Put User User Contacts By User Contact Id Fail With Wrong Params
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile_422}  name=${name_422}  car_type=${car_type_422}  
   run every case by params  Put User User Contacts By User Contact Id Fail 422  ${essential_params}  ${unessential_params}  user_contact_id=${user_contact_id}

Put is Default by user contact id Success 
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Put is Default by user contact id Success 204  user_contact_id/is_default=${user_contact_id/is_default}

Put is Default by user contact id Fail With Wrong Url
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Put is Default by user contact id Fail 404  user_contact_id/is_default=${wrong_url_id}

Put is Default by user contact id Fail With Wrong Params
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   Put is Default by user contact id Fail 422  user_contact_id/is_default=${user_contact_id/is_default}

Delete User User Contacts By User Contact Id Fail With Wrong Url
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete User User Contacts By User Contact Id Fail 404  user_contact_id=${wrong_url_id}

Delete User User Contacts By User Contact Id Success 
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete User User Contacts By User Contact Id Success 204  user_contact_id=${user_contact_id}


*** Variables ***
${user_contact_id}  
${user_contact_id/is_default}  


*** Keywords ***
Post User User Contacts Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Contacts   &{kwargs}
   expect status is 201  ${resp}  wxmp_user_contact/Post_User_User_Contacts_201.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id]}
   set global variable   ${user_contact_id}
   ${user_contact_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id/is_default]}
   set global variable   ${user_contact_id/is_default}

Post User User Contacts Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Contacts   &{kwargs}
   expect status is 422  ${resp}  

Get User User Contacts By User Contact Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Contacts By User Contact Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_user_contact/Get_User_User_Contacts_By_User_Contact_Id_200.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id]}
   set global variable   ${user_contact_id}
   ${user_contact_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id/is_default]}
   set global variable   ${user_contact_id/is_default}

Get User User Contacts By User Contact Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Contacts By User Contact Id   &{kwargs}
   expect status is 404  ${resp}  

Get User User Contacts Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Contacts   &{kwargs}
   expect status is 200  ${resp}  wxmp_user_contact/Get_User_User_Contacts_200.json
   ${user_contact_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id]}
   set global variable   ${user_contact_id}
   ${user_contact_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_contact_id/is_default]}
   set global variable   ${user_contact_id/is_default}

Put User User Contacts By User Contact Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Contacts By User Contact Id   &{kwargs}
   expect status is 204  ${resp}  

Put User User Contacts By User Contact Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Contacts By User Contact Id   &{kwargs}
   expect status is 404  ${resp}  

Put User User Contacts By User Contact Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Contacts By User Contact Id   &{kwargs}
   expect status is 422  ${resp}  

Put is Default by user contact id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user contact id   &{kwargs}
   expect status is 204  ${resp}  

Put is Default by user contact id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user contact id   &{kwargs}
   expect status is 404  ${resp}  

Put is Default by user contact id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user contact id   &{kwargs}
   expect status is 422  ${resp}  

Delete User User Contacts By User Contact Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Contacts By User Contact Id   &{kwargs}
   expect status is 404  ${resp}  

Delete User User Contacts By User Contact Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Contacts By User Contact Id   &{kwargs}
   expect status is 204  ${resp}  

