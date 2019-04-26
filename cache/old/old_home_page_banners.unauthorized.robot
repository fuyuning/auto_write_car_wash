*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Force Tags  model:wxmp_home_page_banner  车主微信端


*** Test Cases ***
Get Home Page Banners Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Home Page Banners Fail 403


*** Keywords ***
Get Home Page Banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Home Page Banners   &{kwargs}
   expect status is 403  ${resp}  

