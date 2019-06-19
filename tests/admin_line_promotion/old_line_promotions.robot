*** Settings ***
Documentation  admin_line_promotion
Resource  ../resources.robot
Library  robot_car_wash_server_library.line_promotion.LinePromotionLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_line_promotion  虾洗后台


