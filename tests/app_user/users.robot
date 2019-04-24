*** Settings ***
Documentation  app_user
Resource  ../resources.robot
Library  robot_car_wash_app_library.user.UserLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_user  虾客APP


*** Test Cases ***
Get car Wash user Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get car Wash user Success 200


*** Keywords ***
Get car Wash user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash user   &{kwargs}
   expect status is 200  ${resp}  app_user/Get_car_Wash_user_200.json

