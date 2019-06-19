*** Settings ***
Documentation  wxmp_invitation
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation.InvitationLibrary
Force Tags  model:wxmp_invitation  车主微信端


*** Test Cases ***
post user invitation accept Fail Without Login
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user invitation accept fail 403     invite_code=${invite_code}  mobile=${mobile}  

get user invitations Fail Without Login
   [Documentation]  接口名:获取邀请好友明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user invitations fail 403     is_arrived=${is_arrived}  page_num=${page_num}  page_size=${page_size}  

get user invitations count Fail Without Login
   [Documentation]  接口名:获取我的邀请人到账情况${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user invitations count fail 403

get user invite code Fail Without Login
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user invite code fail 403     mobile=${mobile}  


*** Keywords ***
post user invitation accept Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user invitation accept  &{kwargs}
   expect status is 403  ${resp}  

get user invitations Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user invitations  &{kwargs}
   expect status is 403  ${resp}  

get user invitations count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user invitations count  &{kwargs}
   expect status is 403  ${resp}  

get user invite code Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user invite code  &{kwargs}
   expect status is 403  ${resp}  

