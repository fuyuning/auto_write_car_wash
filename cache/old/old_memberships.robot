*** Settings ***
Documentation  wxmp_membership
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.membership.MembershipLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_membership  车主微信端


*** Test Cases ***
get user memberships Success 
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Membership 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get user memberships Success 200  ${essential_params}  ${unessential_params}

get user memberships Fail With Wrong Params
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get user memberships Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get user memberships Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships  &{kwargs}
   expect status is 200  ${resp}  wxmp_membership/get_user_memberships_200.json

get user memberships Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships  &{kwargs}
   expect status is 422  ${resp}  

