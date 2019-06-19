*** Settings ***
Documentation  wxmp_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation_banner.InvitationBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_invitation_banner  车主微信端


*** Test Cases ***
get invitation banners Success 
   [Documentation]  接口名:获取邀请好友界面设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 InvitationBanner 列表。
   [Tags]           Respcode:200
    get invitation banners success 200


*** Keywords ***
get invitation banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get invitation banners  &{kwargs}
   expect status is 200  ${resp}  wxmp_invitation_banner/get_invitation_banners_200.json

