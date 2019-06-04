*** Settings ***
Documentation  app_user
Resource  ../resources.robot
Library  robot_washing_expert_library.user.UserLibrary
Force Tags  model:app_user  虾客APP


*** Test Cases ***
get car wash user Fail Without Login
   [Documentation]  接口名:获取虾客信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get car wash user fail 403


*** Keywords ***
get car wash user Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user  &{kwargs}
   expect status is 403  ${resp}  

