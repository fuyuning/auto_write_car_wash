*** Settings ***
Documentation  admin_wash_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_record  虾洗后台


