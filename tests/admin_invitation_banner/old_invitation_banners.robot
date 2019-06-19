*** Settings ***
Documentation  admin_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation_banner.InvitationBannerLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_invitation_banner  虾洗后台


