*** Settings ***
Documentation  app_call_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.call_user.CallUserLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_call_user  虾客APP


*** Test Cases ***
post car wash send mobile short message Success 
   [Documentation]  接口名:短信联系车主${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  type=${type}  wash_record_id=${wash_record_id}  
   ${unessential_params}  create list  
   run every case by params  post car wash send mobile short message Success 200  ${essential_params}  ${unessential_params}

post car wash send mobile short message Fail With Wrong Params
   [Documentation]  接口名:短信联系车主${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  type=${type_422}  wash_record_id=${wash_record_id_422}  
   ${unessential_params}  create list  
   run every case by params  post car wash send mobile short message Fail 422  ${essential_params}  ${unessential_params}  success=False

get car wash get virtual mobile Success 
   [Documentation]  接口名:电话联系车主${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  
   ${unessential_params}  create list  
   run every case by params  get car wash get virtual mobile Success 201  ${essential_params}  ${unessential_params}

get car wash get virtual mobile Fail With Wrong Params
   [Documentation]  接口名:电话联系车主${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id_422}  
   ${unessential_params}  create list  
   run every case by params  get car wash get virtual mobile Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post car wash send mobile short message Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post car wash send mobile short message  &{kwargs}
   expect status is 200  ${resp}  app_call_user/post_car_wash_send_mobile_short_message_200.json

post car wash send mobile short message Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash send mobile short message  &{kwargs}
   expect status is 422  ${resp}  

get car wash get virtual mobile Success 201
   [Arguments]  &{kwargs}
   ${resp}=  get car wash get virtual mobile  &{kwargs}
   expect status is 201  ${resp}  app_call_user/get_car_wash_get_virtual_mobile_201.json

get car wash get virtual mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash get virtual mobile  &{kwargs}
   expect status is 422  ${resp}  

