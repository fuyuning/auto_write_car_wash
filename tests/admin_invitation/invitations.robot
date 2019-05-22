*** Settings ***
Documentation  admin_invitation
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation.InvitationLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_invitation  虾洗后台


*** Test Cases ***
get admin invitations Success 
   [Documentation]  接口名:邀请记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Invitation 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  invited_userid=${invited_userid}  first_car_id=${first_car_id}  first_mobile=${first_mobile}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin invitations Success 200  ${essential_params}  ${unessential_params}

get admin invitations Fail With Wrong Params
   [Documentation]  接口名:邀请记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid_422}  invited_userid=${invited_userid_422}  first_car_id=${first_car_id_422}  first_mobile=${first_mobile_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin invitations Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin invitations Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin invitations  &{kwargs}
   expect status is 200  ${resp}  admin_invitation/get_admin_invitations_200.json

get admin invitations Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin invitations  &{kwargs}
   expect status is 422  ${resp}  

