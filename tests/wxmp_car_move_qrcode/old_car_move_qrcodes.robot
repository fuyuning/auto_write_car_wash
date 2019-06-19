*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_car_move_qrcode  车主微信端


