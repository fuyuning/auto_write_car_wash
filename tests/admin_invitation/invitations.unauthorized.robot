*** Settings ***
Documentation  admin_invitation
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation.InvitationLibrary
Force Tags  model:admin_invitation  虾洗后台


*** Test Cases ***
get admin invitations Fail Without Login
   [Documentation]  接口名:邀请记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin invitations fail 403     userid=${userid}  invited_userid=${invited_userid}  first_car_id=${first_car_id}  first_mobile=${first_mobile}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get admin invitations Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin invitations  &{kwargs}
   expect status is 403  ${resp}  

