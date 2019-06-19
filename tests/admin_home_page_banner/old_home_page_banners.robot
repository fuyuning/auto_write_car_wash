*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_home_page_banner  虾洗后台


