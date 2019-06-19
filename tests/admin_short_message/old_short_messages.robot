*** Settings ***
Documentation  admin_short_message
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message.ShortMessageLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_short_message  虾洗后台


