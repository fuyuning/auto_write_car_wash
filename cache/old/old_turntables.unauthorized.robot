*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Force Tags  model:wxmp_turntable  车主微信端


*** Test Cases ***
post user turntable award Fail Without Login
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  post user turntable award Fail 403  ${essential_params}  ${unessential_params}

get user turntable Fail Without Login
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  get user turntable Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
post user turntable award Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user turntable award  &{kwargs}
   expect status is 403  ${resp}  

get user turntable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable  &{kwargs}
   expect status is 403  ${resp}  

