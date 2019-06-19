*** Settings ***
Documentation  admin_user_contact
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_contact.UserContactLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_user_contact  虾洗后台


