*** Settings ***
Documentation  app_call_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.call_user.CallUserLibrary
Force Tags  model:app_call_user  虾客APP


*** Test Cases ***
post car wash send mobile short message Fail Without Login
   [Documentation]  接口名:短信联系车主${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  type=${type}  wash_record_id=${wash_record_id}  
   ${unessential_params}  create list  
   run every case by params  post car wash send mobile short message Fail 403  ${essential_params}  ${unessential_params}

get car wash get virtual mobile Fail Without Login
   [Documentation]  接口名:电话联系车主${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  
   ${unessential_params}  create list  
   run every case by params  get car wash get virtual mobile Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
post car wash send mobile short message Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash send mobile short message  &{kwargs}
   expect status is 403  ${resp}  

get car wash get virtual mobile Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash get virtual mobile  &{kwargs}
   expect status is 403  ${resp}  
