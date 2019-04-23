*** Settings ***
Documentation  admin_custom_menu
Resource  ../resources.robot
Library  robot_car_wash_server_library.custom_menu.CustomMenuLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_custom_menu  虾洗后台


*** Test Cases ***
Put custom_menu Success 
   [Documentation]  接口名:自定义菜单${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Put admin custom menus Success 204  ${essential_params}  ${unessential_params}



Put custom_menu Fail Without Login
   [Documentation]  接口名:自定义菜单${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Put admin custom menus Fail 403  ${essential_params}  ${unessential_params}



Put custom_menu Fail With Wrong Params
   [Documentation]  接口名:自定义菜单${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  menu=${menu}  
   ${unessential_params}  create list  
   run every case by params  Put admin custom menus Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Put Admin custom menus Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin custom menus   &{kwargs}
   expect status is 204  ${resp}  

Put Admin custom menus Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin custom menus   &{kwargs}
   expect status is 403  ${resp}  

Put Admin custom menus Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin custom menus   &{kwargs}
   expect status is 422  ${resp}  

