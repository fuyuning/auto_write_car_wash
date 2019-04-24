*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_menu  虾洗后台


*** Test Cases ***
Get Admin Wechat Menus Success 
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get Admin Wechat Menus Success 200

Get Admin Wechat Menus Fail With Wrong Url
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get Admin Wechat Menus Fail 404

Put Admin Wechat Menus Success 
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Menus Success 204  ${essential_params}  ${unessential_params}

Put Admin Wechat Menus Fail With Wrong Params
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Menus Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Wechat Menus Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Menus   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_menu/Get_Admin_Wechat_Menus_200.json

Get Admin Wechat Menus Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Menus   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wechat Menus Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Menus   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wechat Menus Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Menus   &{kwargs}
   expect status is 422  ${resp}  

