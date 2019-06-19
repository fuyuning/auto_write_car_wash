*** Settings ***
Documentation  admin_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.shop_banner.ShopBannerLibrary
Force Tags  model:admin_shop_banner  虾洗后台


*** Test Cases ***
get admin shop banner Fail Without Login
   [Documentation]  接口名:获取角标${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin shop banner fail 403

put admin shop banner by shop banner id Fail Without Login
   [Documentation]  接口名:修改角标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin shop banner by shop banner id fail 403     shop_banner_id=${shop_banner_id}    banner=${banner}  service_introduce=${service_introduce}  


*** Variables ***
${shop_banner_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin shop banner Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin shop banner  &{kwargs}
   expect status is 403  ${resp}  

put admin shop banner by shop banner id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin shop banner by shop banner id  &{kwargs}
   expect status is 403  ${resp}  

