*** Settings ***
Documentation  admin_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_move_qrcode  虾洗后台


