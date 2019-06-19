*** Settings ***
Documentation  wxmp_invitation
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation.InvitationLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_invitation  车主微信端


*** Test Cases ***
post user invitation accept Success 
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  invite_code=${invite_code}  mobile=${mobile}  
   run every case by params   post user invitation accept success 204   ${essential_params}  ${unessential_params}

post user invitation accept Fail With Wrong Params
   [Documentation]  接口名:接受邀请${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  invite_code=${invite_code_422}  mobile=${mobile_422}  
   run every case by params   post user invitation accept fail 422   ${essential_params}  ${unessential_params}  success=False

get user invitations Success 
   [Documentation]  接口名:获取邀请好友明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Invitation 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  is_arrived=${is_arrived}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get user invitations success 200   ${essential_params}  ${unessential_params}

get user invitations Fail With Wrong Params
   [Documentation]  接口名:获取邀请好友明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  is_arrived=${is_arrived_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get user invitations fail 422   ${essential_params}  ${unessential_params}  success=False

get user invitations count Success 
   [Documentation]  接口名:获取我的邀请人到账情况${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get user invitations count success 200

get user invite code Success 
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 InviteCode 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mobile=${mobile}  
   run every case by params   get user invite code success 200   ${essential_params}  ${unessential_params}

get user invite code Fail With Wrong Params
   [Documentation]  接口名:获取我的邀请码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mobile=${mobile_422}  
   run every case by params   get user invite code fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post user invitation accept Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post user invitation accept  &{kwargs}
   expect status is 204  ${resp}  

post user invitation accept Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user invitation accept  &{kwargs}
   expect status is 422  ${resp}  

get user invitations Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user invitations  &{kwargs}
   expect status is 200  ${resp}  wxmp_invitation/get_user_invitations_200.json

get user invitations Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user invitations  &{kwargs}
   expect status is 422  ${resp}  

get user invitations count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user invitations count  &{kwargs}
   expect status is 200  ${resp}  wxmp_invitation/get_user_invitations_count_200.json

get user invite code Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user invite code  &{kwargs}
   expect status is 200  ${resp}  wxmp_invitation/get_user_invite_code_200.json

get user invite code Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user invite code  &{kwargs}
   expect status is 422  ${resp}  

