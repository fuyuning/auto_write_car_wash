*** Settings ***
Documentation  wxmp_turntable
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.turntable.TurntableLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_turntable  车主微信端


*** Test Cases ***
post user turntable award Success 
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  key=${key}  
   ${unessential_params}  create dictionary  mobile=${mobile}  
   run every case by params   post user turntable award success 201   ${essential_params}  ${unessential_params}

post user turntable award Fail With Wrong Params
   [Documentation]  接口名:抽奖${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  key=${key_422}  
   ${unessential_params}  create dictionary  mobile=${mobile_422}  
   run every case by params   post user turntable award fail 422   ${essential_params}  ${unessential_params}  success=False

get user turntable Success 
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  key=${key}  
   ${unessential_params}  create dictionary  
   run every case by params   get user turntable success 200   ${essential_params}  ${unessential_params}

get user turntable Fail With Wrong Params
   [Documentation]  接口名:获取我的抽奖资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  key=${key_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get user turntable fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post user turntable award Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user turntable award  &{kwargs}
   expect status is 201  ${resp}  wxmp_turntable/post_user_turntable_award_201.json

post user turntable award Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user turntable award  &{kwargs}
   expect status is 422  ${resp}  

get user turntable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable  &{kwargs}
   expect status is 200  ${resp}  wxmp_turntable/get_user_turntable_200.json

get user turntable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user turntable  &{kwargs}
   expect status is 422  ${resp}  

