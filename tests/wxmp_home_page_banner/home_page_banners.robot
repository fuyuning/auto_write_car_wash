*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_home_page_banner  车主微信端


*** Test Cases ***
Get Home Page Banners Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    Get Home Page Banners Success 200


*** Keywords ***
Get Home Page Banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Home Page Banners   &{kwargs}
   expect status is 200  ${resp}  wxmp_home_page_banner/Get_Home_Page_Banners_200.json

