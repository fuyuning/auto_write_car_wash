*** Settings ***
Documentation  admin_voucher
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher.VoucherLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher  虾洗后台


