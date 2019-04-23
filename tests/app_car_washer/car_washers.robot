*** Settings ***
Documentation  app_car_washer
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_washer  虾客APP


*** Test Cases ***
Get car_washer Fail With Wrong Url
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get car wash car washer Fail 404


Get car_washer Fail Without Login
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get car wash car washer Fail 403


Get car_washer Success 
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasher 列表。
   [Tags]           Respcode:200
    Get car wash car washer Success 200


*** Variables ***


*** Keywords ***
Get Car wash car washer Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washer   &{kwargs}
   expect status is 404  ${resp}  

Get Car wash car washer Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washer   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash car washer Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washer   &{kwargs}
   expect status is 200  ${resp}  app_car_washer/Get_Car_wash_car_washer_200.json

