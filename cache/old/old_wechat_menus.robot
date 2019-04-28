*** Settings ***
Documentation  admin_wechat_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_menu.WechatMenuLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_menu  虾洗后台


*** Test Cases ***
post admin wechat menus Success 
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  button=${button}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat menus Success 201  ${essential_params}  ${unessential_params}

post admin wechat menus Fail With Wrong Params
   [Documentation]  接口名:编辑自定义菜单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  button=${button_422}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat menus Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin wechat menus Success 
   [Documentation]  接口名:获取自定义菜单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get admin wechat menus Success 200


*** Keywords ***
post admin wechat menus Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat menus  &{kwargs}
   expect status is 201  ${resp}  admin_wechat_menu/post_admin_wechat_menus_201.json

post admin wechat menus Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat menus  &{kwargs}
   expect status is 422  ${resp}  

get admin wechat menus Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat menus  &{kwargs}
   expect status is 200  ${resp}  admin_wechat_menu/get_admin_wechat_menus_200.json

