*** Settings ***
Documentation  wxmp_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_home_page_banner  车主微信端


*** Test Cases ***
Get home_page_banner Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get home page banners Fail 403


Get home_page_banner Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    Get home page banners Success 200


*** Variables ***


*** Keywords ***
Get Home page banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get home page banners   &{kwargs}
   expect status is 403  ${resp}  

Get Home page banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get home page banners   &{kwargs}
   expect status is 200  ${resp}  wxmp_home_page_banner/Get_Home_page_banners_200.json

