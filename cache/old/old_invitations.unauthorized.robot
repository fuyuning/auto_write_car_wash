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
   ${essential_params}  create list  
   ${unessential_params}  create list  invite_code=${invite_code}  mobile=${mobile}  
   run every case by params  post user invitation accept Fail 403  ${essential_params}  ${unessential_params}

get user invite code Fail Without Login
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  get user invite code Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
post user invitation accept Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user invitation accept  &{kwargs}
   expect status is 403  ${resp}  

get user invite code Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user invite code  &{kwargs}
   expect status is 403  ${resp}  

