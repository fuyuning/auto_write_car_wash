*** Settings ***
Documentation  admin_short_message_template
Resource  ../resources.robot
Library  robot_car_wash_server_library.short_message_template.ShortMessageTemplateLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_short_message_template  虾洗后台


