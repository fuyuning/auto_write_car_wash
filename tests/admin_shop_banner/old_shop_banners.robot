*** Settings ***
Documentation  admin_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.shop_banner.ShopBannerLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_shop_banner  虾洗后台


