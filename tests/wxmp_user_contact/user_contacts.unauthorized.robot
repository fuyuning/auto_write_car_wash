*** Settings ***
Documentation  wxmp_user_contact
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_contact.UserContactLibrary
Force Tags  model:wxmp_user_contact  车主微信端


Post User User Contacts Fail Without Login
   [Documentation]  接口名:添加联系方式${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_type=${car_type}  
   ${unessential_params}  create list  
   run every case by params  Post User User Contacts Fail 403  ${essential_params}  ${unessential_params}

Get User User Contacts By User Contact Id Fail Without Login
   [Documentation]  接口名:更改联系方式查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get User User Contacts By User Contact Id Fail 403  user_contact_id=${user_contact_id}

Get User User Contacts Fail Without Login
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get User User Contacts Fail 403

Put User User Contacts By User Contact Id Fail Without Login
   [Documentation]  接口名:更改联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  name=${name}  car_type=${car_type}  
   run every case by params  Put User User Contacts By User Contact Id Fail 403  ${essential_params}  ${unessential_params}  user_contact_id=${user_contact_id}

Put is Default by user contact id Fail Without Login
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Put is Default by user contact id Fail 403  user_contact_id/is_default=${user_contact_id/is_default}

Delete User User Contacts By User Contact Id Fail Without Login
   [Documentation]  接口名:删除联系方式${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete User User Contacts By User Contact Id Fail 403  user_contact_id=${user_contact_id}

Post User User Contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Contacts   &{kwargs}
   expect status is 403  ${resp}  

Get User User Contacts By User Contact Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Contacts By User Contact Id   &{kwargs}
   expect status is 403  ${resp}  

Get User User Contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Contacts   &{kwargs}
   expect status is 403  ${resp}  

Put User User Contacts By User Contact Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Contacts By User Contact Id   &{kwargs}
   expect status is 403  ${resp}  

Put is Default by user contact id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user contact id   &{kwargs}
   expect status is 403  ${resp}  

Delete User User Contacts By User Contact Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Contacts By User Contact Id   &{kwargs}
   expect status is 403  ${resp}  

