*** Settings ***
Documentation  wxmp_membership
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.membership.MembershipLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_membership  车主微信端


*** Test Cases ***
Get membership Fail Without Login
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user memberships Fail 403  ${essential_params}  ${unessential_params}



Get membership Success 
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Membership 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user memberships Success 200  ${essential_params}  ${unessential_params}



Get membership Fail With Wrong Params
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user memberships Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get User memberships Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships   &{kwargs}
   expect status is 403  ${resp}  

Get User memberships Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships   &{kwargs}
   expect status is 200  ${resp}  wxmp_membership/Get_User_memberships_200.json

Get User memberships Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships   &{kwargs}
   expect status is 422  ${resp}  

