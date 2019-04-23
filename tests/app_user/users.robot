*** Settings ***
Documentation  app_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.user.UserLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_user  虾客APP


*** Test Cases ***
Get user Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get car wash user Fail 403


Get user Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get car wash user Success 200


*** Variables ***


*** Keywords ***
Get Car wash user Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user   &{kwargs}
   expect status is 200  ${resp}  app_user/Get_Car_wash_user_200.json

