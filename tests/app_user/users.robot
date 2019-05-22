*** Settings ***
Documentation  app_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.user.UserLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_user  虾客APP


*** Test Cases ***
get car wash user Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get car wash user Success 200


*** Keywords ***
get car wash user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user  &{kwargs}
   expect status is 200  ${resp}  app_user/get_car_wash_user_200.json

