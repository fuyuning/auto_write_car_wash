*** Settings ***
Documentation  admin_wechat_reply
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_reply.WechatReplyLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_reply  虾洗后台


