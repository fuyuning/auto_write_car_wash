*** Settings ***
Documentation  wxmp_invitation
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.invitation.InvitationLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_invitation  车主微信端


