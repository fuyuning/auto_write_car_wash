*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_menu  虾洗后台


*** Test Cases ***
Post Admin Wechat Menus Success 
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Menus Success 201  ${essential_params}  ${unessential_params}

Post Admin Wechat Menus Fail With Wrong Params
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Menus Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wechat Menus Success 
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get Admin Wechat Menus Success 200


*** Keywords ***
Post Admin Wechat Menus Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Menus   &{kwargs}
   expect status is 201  ${resp}  admin_wechat_menu/Post_Admin_Wechat_Menus_201.json

Post Admin Wechat Menus Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Menus   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wechat Menus Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Menus   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_menu/Get_Admin_Wechat_Menus_200.json

