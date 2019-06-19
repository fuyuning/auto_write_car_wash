*** Settings ***
Documentation  admin_robot
Resource  ../resources.robot
Library  robot_car_wash_server_library.robot.RobotLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_robot  虾洗后台


