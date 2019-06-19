*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_menu  虾洗后台


