*** Settings ***
Documentation  admin_promoter_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter_statistic.PromoterStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_promoter_statistic  虾洗后台


