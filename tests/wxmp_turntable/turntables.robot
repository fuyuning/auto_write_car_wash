*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_turntable  车主微信端


*** Test Cases ***
Post turntable Fail Without Login
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post turntable award Fail 403  ${essential_params}  ${unessential_params}



Post turntable Fail With Wrong Url
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post turntable award Fail 404  ${essential_params}  ${unessential_params}



Post turntable Success 
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post turntable award Success 200  ${essential_params}  ${unessential_params}



Post turntable Fail With Wrong Params
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post turntable award Fail 422  ${essential_params}  ${unessential_params}



Get turntable Fail Without Login
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get user turntable Fail 403  ${essential_params}  ${unessential_params}



Get turntable Fail With Wrong Url
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get user turntable Fail 404  ${essential_params}  ${unessential_params}



Get turntable Success 
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get user turntable Success 200  ${essential_params}  ${unessential_params}



Get turntable Fail With Wrong Params
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  key=${key}  
   ${unessential_params}  create list  
   run every case by params  Get user turntable Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Post Turntable award Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post turntable award   &{kwargs}
   expect status is 403  ${resp}  

Post Turntable award Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post turntable award   &{kwargs}
   expect status is 404  ${resp}  

Post Turntable award Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post turntable award   &{kwargs}
   expect status is 200  ${resp}  wxmp_turntable/Post_Turntable_award_200.json

Post Turntable award Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post turntable award   &{kwargs}
   expect status is 422  ${resp}  

Get User turntable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable   &{kwargs}
   expect status is 403  ${resp}  

Get User turntable Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable   &{kwargs}
   expect status is 404  ${resp}  

Get User turntable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable   &{kwargs}
   expect status is 200  ${resp}  wxmp_turntable/Get_User_turntable_200.json

Get User turntable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable   &{kwargs}
   expect status is 422  ${resp}  

