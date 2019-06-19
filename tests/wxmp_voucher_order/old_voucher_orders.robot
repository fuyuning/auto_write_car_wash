*** Settings ***
Documentation  wxmp_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_order.VoucherOrderLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher_order  车主微信端


