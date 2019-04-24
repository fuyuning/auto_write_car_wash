*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Force Tags  model:wxmp_turntable  车主微信端


*** Test Cases ***
Post Turntable Award Fail Without Login
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post Turntable Award Fail 403  ${essential_params}  ${unessential_params}

Get User Turntable Fail Without Login
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get User Turntable Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Turntable Award Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Turntable Award   &{kwargs}
   expect status is 403  ${resp}  

Get User Turntable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Turntable   &{kwargs}
   expect status is 403  ${resp}  

