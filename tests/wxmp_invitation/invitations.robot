*** Settings ***
Documentation  wxmp_invitation
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation.InvitationLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_invitation  车主微信端


*** Test Cases ***
Post Invitation Accept Success 
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  invite_code=${invite_code}  mobile=${mobile}  
   run every case by params  Post Invitation Accept Success 204  ${essential_params}  ${unessential_params}

Post Invitation Accept Fail With Wrong Params
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  invite_code=${invite_code}  mobile=${mobile}  
   run every case by params  Post Invitation Accept Fail 422  ${essential_params}  ${unessential_params}

Get User Invite Code Success 
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 InviteCode 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Get User Invite Code Success 200  ${essential_params}  ${unessential_params}

Get User Invite Code Fail With Wrong Params
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Get User Invite Code Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Invitation Accept Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Invitation Accept   &{kwargs}
   expect status is 204  ${resp}  

Post Invitation Accept Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Invitation Accept   &{kwargs}
   expect status is 422  ${resp}  

Get User Invite Code Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Invite Code   &{kwargs}
   expect status is 200  ${resp}  wxmp_invitation/Get_User_Invite_Code_200.json

Get User Invite Code Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Invite Code   &{kwargs}
   expect status is 422  ${resp}  

