*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Force Tags  model:admin_wechat_menu  虾洗后台


*** Test Cases ***
post admin wechat menus Fail Without Login
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin wechat menus fail 403   button=${button}    

get admin wechat menus Fail Without Login
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin wechat menus fail 403


*** Keywords ***
post admin wechat menus Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat menus  &{kwargs}
   expect status is 403  ${resp}  

get admin wechat menus Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat menus  &{kwargs}
   expect status is 403  ${resp}  

