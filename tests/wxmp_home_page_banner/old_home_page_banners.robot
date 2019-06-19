*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_home_page_banner  车主微信端


