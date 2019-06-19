*** Settings ***
Documentation  wxmp_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_pool.VoucherPoolLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher_pool  车主微信端


