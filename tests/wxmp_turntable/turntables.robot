*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_turntable  车主微信端


*** Test Cases ***
Post Turntable Award Fail With Wrong Url
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post Turntable Award Fail 404  ${essential_params}  ${unessential_params}

Post Turntable Award Success 
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post Turntable Award Success 200  ${essential_params}  ${unessential_params}

Post Turntable Award Fail With Wrong Params
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post Turntable Award Fail 422  ${essential_params}  ${unessential_params}

Get User Turntable Fail With Wrong Url
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get User Turntable Fail 404  ${essential_params}  ${unessential_params}

Get User Turntable Success 
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get User Turntable Success 200  ${essential_params}  ${unessential_params}

Get User Turntable Fail With Wrong Params
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get User Turntable Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Turntable Award Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Turntable Award   &{kwargs}
   expect status is 404  ${resp}  

Post Turntable Award Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Turntable Award   &{kwargs}
   expect status is 200  ${resp}  wxmp_turntable/Post_Turntable_Award_200.json

Post Turntable Award Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Turntable Award   &{kwargs}
   expect status is 422  ${resp}  

Get User Turntable Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Turntable   &{kwargs}
   expect status is 404  ${resp}  

Get User Turntable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Turntable   &{kwargs}
   expect status is 200  ${resp}  wxmp_turntable/Get_User_Turntable_200.json

Get User Turntable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Turntable   &{kwargs}
   expect status is 422  ${resp}  

