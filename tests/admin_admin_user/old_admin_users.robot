*** Settings ***
Documentation  admin_admin_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_user.AdminUserLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_admin_user  虾洗后台


