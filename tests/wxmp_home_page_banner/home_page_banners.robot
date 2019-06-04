*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_home_page_banner  车主微信端


*** Test Cases ***
get home page banners Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    get home page banners success 200


*** Keywords ***
get home page banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get home page banners  &{kwargs}
   expect status is 200  ${resp}  wxmp_home_page_banner/get_home_page_banners_200.json

