*** Settings ***
Documentation  admin_card_sale
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_sale.CardSaleLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_card_sale  虾洗后台


