*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Force Tags  model:wxmp_home_page_banner  车主微信端


*** Test Cases ***
get home page banners Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get home page banners fail 403


*** Keywords ***
get home page banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get home page banners  &{kwargs}
   expect status is 403  ${resp}  

