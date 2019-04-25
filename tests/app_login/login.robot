*** Settings ***
Documentation   expert_login
Resource        ../resources.robot
Library         robot_car_wash_app_library.accredit.LoginLibrary
Force Tags      login  虾客APP

*** Variables ***
${username}                 987654321
${password}                 fuyuning123

*** Test Cases ***
Login Test
    [Tags]              RespCode:200
    Login Success           ${username}   ${password}

Login Fail With Wrong Params
    [Tags]              RespCode:422
    Login Fail 422          admin  []

Login Fail
    [Tags]              RespCode:403
    Login Fail 403          987654321  admin123
    Login Fail 403          000000001  admin123

Refurbish Test
    [Tags]              RespCode:200
    Refurbish Success

*** Keywords ***
Login Success
    [Arguments]             ${client_id}  ${secret}  ${username}  ${password}
    ${resp} =               Login  ${client_id}  ${secret}  ${username}  ${password}
    expect status is 200    ${resp}      expert_accredit/post_200.schema.json

Login Fail 422
    [Arguments]             ${client_id}  ${secret}  ${username}  ${password}
    ${resp} =               Login  ${client_id}  ${secret}  ${username}  ${password}
    expect status is 422    ${resp}

Login Fail 403
    [Arguments]             ${client_id}  ${secret}  ${username}  ${password}
    ${resp} =               Login  ${client_id}  ${secret}  ${username}  ${password}
    expect status is 403    ${resp}

Refurbish Success
    [Arguments]             ${client_id}  ${secret}
    ${resp} =               Refurbish  ${client_id}  ${secret}
    expect status is 200    ${resp}    expert_accredit/post_200.schema.json




