*** Settings ***
Documentation   admin_获取信息
Resource        ../resources.robot
Library         robot_car_wash_server_library.account.UserLibrary
Force Tags      model：admin_user  虾洗后台



*** Test Cases ***
Get User Info
    [Tags]              RespCode :200
    [Setup]             Login  admin  admin123
    ${resp} =           Get User
    Status Should be    ${resp}  200
    [Teardown]          Logout
