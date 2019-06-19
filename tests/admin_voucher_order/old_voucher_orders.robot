*** Settings ***
Documentation  admin_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_order.VoucherOrderLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher_order  虾洗后台


