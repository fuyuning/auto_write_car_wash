*** Settings ***
Documentation  wxmp_membership
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.membership.MembershipLibrary
Force Tags  model:wxmp_membership  车主微信端


*** Test Cases ***
Get User Memberships Fail Without Login
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get User Memberships Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get User Memberships Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Memberships   &{kwargs}
   expect status is 403  ${resp}  

