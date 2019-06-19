*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_promoter  虾洗后台


