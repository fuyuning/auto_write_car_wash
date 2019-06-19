*** Settings ***
Documentation  admin_user_car
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_car.UserCarLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_user_car  虾洗后台


