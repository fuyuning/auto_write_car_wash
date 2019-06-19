*** Settings ***
Documentation  wxmp_membership
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.membership.MembershipLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_membership  车主微信端


