*** Settings ***
Documentation  wxmp_membership
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.membership.MembershipLibrary
Force Tags  model:wxmp_membership  车主微信端


*** Test Cases ***
get user memberships Fail Without Login
   [Documentation]  接口名:我的会员${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user memberships fail 403     status=${status}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get user memberships Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user memberships  &{kwargs}
   expect status is 403  ${resp}  

