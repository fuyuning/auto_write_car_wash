*** Settings ***
Documentation  admin_wash_area
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_area.WashAreaLibrary
Force Tags  model:admin_wash_area  虾洗后台


*** Test Cases ***
post admin wash areas Fail Without Login
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin wash areas fail 403   name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}    wash_normal=False  wash_group=False  user_group=False  enabled=False  car_washers=${car_washers}  copywriting=${copywriting}  

get admin wash areas Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash areas fail 403   page_num=${page_num}  page_size=${page_size}    name=${name}  enabled=False  

get admin wash areas by wash area id Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash areas by wash area id fail 403     wash_area_id=${wash_area_id}

put admin wash areas by wash area id Fail Without Login
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash areas by wash area id fail 403     wash_area_id=${wash_area_id}  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}    wash_normal=False  wash_group=False  user_group=False  enabled=False  car_washers=${car_washers}  copywriting=${copywriting}  

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail Without Login
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id fail 403     wash_area_id=${wash_area_id}    wash_normal=False  wash_group=False  user_group=False  enabled=False  

delete admin wash areas by wash area id Fail Without Login
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wash areas by wash area id fail 403     wash_area_id=${wash_area_id}


*** Variables ***
${wash_area_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash areas  &{kwargs}
   expect status is 403  ${resp}  

get admin wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas  &{kwargs}
   expect status is 403  ${resp}  

get admin wash areas by wash area id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

put admin wash areas by wash area id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash areas (wash normal|wash group|user group|enabled) by wash area id  &{kwargs}
   expect status is 403  ${resp}  

delete admin wash areas by wash area id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash areas by wash area id  &{kwargs}
   expect status is 403  ${resp}  

