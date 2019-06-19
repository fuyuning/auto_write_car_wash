*** Settings ***
Documentation  wxmp_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation_banner.InvitationBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_invitation_banner  车主微信端


