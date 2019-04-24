*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Force Tags  model:admin_wechat_menu  虾洗后台


*** Test Cases ***
Post Admin Wechat Menus Fail Without Login
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Menus Fail 403  ${essential_params}  ${unessential_params}

Get Admin Wechat Menus Fail Without Login
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin Wechat Menus Fail 403


*** Keywords ***
Post Admin Wechat Menus Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Menus   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wechat Menus Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Menus   &{kwargs}
   expect status is 403  ${resp}  

