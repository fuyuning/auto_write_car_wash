*** Settings ***
Documentation  admin_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_pool.VoucherPoolLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher_pool  虾洗后台


