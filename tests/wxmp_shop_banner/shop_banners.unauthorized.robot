*** Settings ***
Documentation  wxmp_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.shop_banner.ShopBannerLibrary
Force Tags  model:wxmp_shop_banner  车主微信端


*** Test Cases ***
get shop banner Fail Without Login
   [Documentation]  接口名:获取角标${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get shop banner fail 403


*** Keywords ***
get shop banner Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get shop banner  &{kwargs}
   expect status is 403  ${resp}  

