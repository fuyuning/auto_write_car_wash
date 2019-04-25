*** Settings ***
Documentation  app_call_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.call_user.CallUserLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_call_user  虾客APP


*** Test Cases ***
Post car Wash send mobile short message Success 
   [Documentation]  接口名:短信联系车主${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  type=${type}  
   ${unessential_params}  create list  
   run every case by params  Post car Wash send mobile short message Success 200  ${essential_params}  ${unessential_params}

Post car Wash send mobile short message Fail With Wrong Params
   [Documentation]  接口名:短信联系车主${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  type=${type}  
   ${unessential_params}  create list  
   run every case by params  Post car Wash send mobile short message Fail 422  ${essential_params}  ${unessential_params}

Get car Wash get virtual mobile Success 
   [Documentation]  接口名:电话联系车主${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
    Get car Wash get virtual mobile Success 201

Get car Wash get virtual mobile Fail With Wrong Params
   [Documentation]  接口名:电话联系车主${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
    Get car Wash get virtual mobile Fail 422


*** Keywords ***
Post car Wash send mobile short message Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash send mobile short message   &{kwargs}
   expect status is 200  ${resp}  app_call_user/Post_car_Wash_send_mobile_short_message_200.json

Post car Wash send mobile short message Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash send mobile short message   &{kwargs}
   expect status is 422  ${resp}  

Get car Wash get virtual mobile Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash get virtual mobile   &{kwargs}
   expect status is 201  ${resp}  app_call_user/Get_car_Wash_get_virtual_mobile_201.json

Get car Wash get virtual mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash get virtual mobile   &{kwargs}
   expect status is 422  ${resp}  

