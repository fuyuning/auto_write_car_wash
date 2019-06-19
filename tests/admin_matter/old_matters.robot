*** Settings ***
Documentation  admin_matter
Resource  ../resources.robot
Library  robot_car_wash_server_library.matter.MatterLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_matter  虾洗后台


