*** Settings ***
Documentation  admin_refund
Resource  ../resources.robot
Library  robot_car_wash_server_library.refund.RefundLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_refund  虾洗后台


