*** Settings ***
Documentation   wxmp_login
Resource        ../resources.robot
Library         robot_car_wash_wxmp_library.login.LoginLibrary
Default Tags    login  车主微信端


*** Variables ***
${openid}       oK75E5xFLRFgecGIR8qpaTM_Cg54
*** Test Cases ***
Login Test
    Login Success          ${openid}

Login Fail
    login fail 403      openid=oK75E5xRqUNv0yg--vCYyEAvRB_
    login fail 422      openid=
*** Keywords ***
Login Success
    [Arguments]         ${openid}
    ${resp} =           login by openid   ${openid}
    Log                 ${resp.json()}
    Status Should be    ${resp}  200

Login Fail 403
    [Arguments]         ${openid}
    ${resp} =           login by openid   ${openid}
    Status Should be    ${resp}  403

Login Fail 422
    [Arguments]         ${openid}
    ${resp} =           login by openid   ${openid}
    Log                 ${resp.json()}
    Status Should be    ${resp}  422
