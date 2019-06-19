*** Settings ***
Documentation  wxmp_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.shop_banner.ShopBannerLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_shop_banner  车主微信端


*** Test Cases ***
get shop banner Success 
   [Documentation]  接口名:获取角标${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ShopBanner 列表。
   [Tags]           Respcode:200
    get shop banner success 200


*** Keywords ***
get shop banner Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get shop banner  &{kwargs}
   expect status is 200  ${resp}  wxmp_shop_banner/get_shop_banner_200.json

