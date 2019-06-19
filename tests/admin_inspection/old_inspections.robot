*** Settings ***
Documentation  admin_inspection
Resource  ../resources.robot
Library  robot_car_wash_server_library.inspection.InspectionLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_inspection  虾洗后台


