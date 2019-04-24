*** Settings ***
Documentation  wxmp_invitation
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation.InvitationLibrary
Force Tags  model:wxmp_invitation  车主微信端


*** Test Cases ***
Post Invitation Accept Fail Without Login
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  invite_code=${invite_code}  mobile=${mobile}  
   run every case by params  Post Invitation Accept Fail 403  ${essential_params}  ${unessential_params}

Get User Invite Code Fail Without Login
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Get User Invite Code Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Invitation Accept Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Invitation Accept   &{kwargs}
   expect status is 403  ${resp}  

Get User Invite Code Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Invite Code   &{kwargs}
   expect status is 403  ${resp}  

