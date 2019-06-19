*** Settings ***
Documentation  admin_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation_banner.InvitationBannerLibrary
Force Tags  model:admin_invitation_banner  虾洗后台


*** Test Cases ***
get admin invitation banner Fail Without Login
   [Documentation]  接口名:获取邀请好友界面设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin invitation banner fail 403

put admin invitation banner by invitation banner id Fail Without Login
   [Documentation]  接口名:邀请好友界面设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin invitation banner by invitation banner id fail 403     invitation_banner_id=${invitation_banner_id}    entrance_banner=${entrance_banner}  interface_poster=${interface_poster}  


*** Variables ***
${invitation_banner_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin invitation banner Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin invitation banner  &{kwargs}
   expect status is 403  ${resp}  

put admin invitation banner by invitation banner id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin invitation banner by invitation banner id  &{kwargs}
   expect status is 403  ${resp}  

