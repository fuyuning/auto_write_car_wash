*** Settings ***
Documentation  wxmp_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.shop_banner.ShopBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_shop_banner  车主微信端


