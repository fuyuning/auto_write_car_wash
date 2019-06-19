*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_keyword  虾洗后台


