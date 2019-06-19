*** Settings ***
Documentation  wxmp_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation_banner.InvitationBannerLibrary
Force Tags  model:wxmp_invitation_banner  车主微信端


*** Test Cases ***
get invitation banners Fail Without Login
   [Documentation]  接口名:获取邀请好友界面设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get invitation banners fail 403


*** Keywords ***
get invitation banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get invitation banners  &{kwargs}
   expect status is 403  ${resp}  

