*** Settings ***
Documentation   wxmp_login
Resource        ../resources.robot
Library         robot_car_wash_wxmp_library.login.LoginLibrary
Default Tags    login  车主微信端


*** Variables ***
${mobile}       15566025172
${captcha}      457321
${openid}       oK75E5xFLRFgecGIR8qpaTM_Cg54
*** Test Cases ***
Login Test
    Login Success       ${openid}   ${mobile}  ${captcha}

*** Keywords ***
Login Success
    [Arguments]         ${openid}  ${mobile}  ${captcha}
    ${resp} =           login by mobile  ${openid}  ${mobile}  ${captcha}
    Log                 ${resp.json()}
    Status Should be    ${resp}  200
