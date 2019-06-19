*** Settings ***
Documentation  admin_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_server_library.lucky_flop.LuckyFlopLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_lucky_flop  虾洗后台


