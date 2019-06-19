*** Settings ***
Documentation  wxmp_voucher
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher.VoucherLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher  车主微信端


