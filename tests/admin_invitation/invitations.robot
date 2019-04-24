*** Settings ***
Documentation  admin_invitation
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation.InvitationLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_invitation  虾洗后台


*** Test Cases ***
Get Admin Invitations Success 
   [Documentation]  接口名:邀请记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Invitation 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  invited_userid=${invited_userid}  first_car_id=${first_car_id}  first_mobile=${first_mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Invitations Success 200  ${essential_params}  ${unessential_params}

Get Admin Invitations Fail With Wrong Params
   [Documentation]  接口名:邀请记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  invited_userid=${invited_userid}  first_car_id=${first_car_id}  first_mobile=${first_mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Invitations Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Invitations Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Invitations   &{kwargs}
   expect status is 200  ${resp}  admin_invitation/Get_Admin_Invitations_200.json

Get Admin Invitations Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Invitations   &{kwargs}
   expect status is 422  ${resp}  

