*** Settings ***
Documentation  admin_card
Resource  ../resources.robot
Library  robot_car_wash_server_library.card.CardLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_card  虾洗后台


