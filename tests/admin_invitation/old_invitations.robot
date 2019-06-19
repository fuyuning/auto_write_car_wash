*** Settings ***
Documentation  admin_invitation
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation.InvitationLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_invitation  虾洗后台


